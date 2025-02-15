from praktika.info import Info

from ci.workflows.defs import JobNames


def only_docs(changed_files):
    for file in changed_files:
        file = file.removeprefix(".").removeprefix("/")
        # TODO: remove
        if file.startswith("ci/"):
            continue
        if (
            file.startswith("docs/")
            or file.startswith("docker/docs")
            or "aspell-dict.txt" in file
        ):
            continue
        else:
            return False
    return True


ONLY_DOCS_JOBS = [
    JobNames.STYLE_CHECK,
    JobNames.DOCKER_BUILDS_ARM,
    JobNames.DOCKER_BUILDS_AMD,
    JobNames.Docs,
]


def should_skip_job(job_name):
    info = Info()
    changed_files = info.get_custom_data("changed_files")
    if not changed_files:
        print("WARNING: no changed files found for PR - do not filter jobs")
        return False, ""

    if only_docs(changed_files) and job_name not in ONLY_DOCS_JOBS:
        return True, "Docs only update"

    # skip ARM perf tests for non-performance update
    if (
        "pr-performance" not in info.pr_labels
        and JobNames.PERFORMANCE in job_name
        and "aarch64" in job_name
    ):
        return True, "Skipped, not labeled with 'pr-performance'"

    return False, ""
