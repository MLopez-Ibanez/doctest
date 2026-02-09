# Release Process for doctest 0.4.0

This directory contains all the necessary files and documentation for releasing version 0.4.0 to CRAN.

## Quick Start

1. **Review the changes:**
   - `DESCRIPTION` - Version updated to 0.4.0
   - `NEWS.md` - Release notes for 0.4.0
   - `cran-comments.md` - Testing information for CRAN

2. **Check GitHub Actions results:**
   - Visit: https://github.com/MLopez-Ibanez/doctest/actions
   - Ensure all R-CMD-check workflows pass (green checkmarks)
   - Review any warnings or notes

3. **Build and check the package:**
   
   **Option A: Use the helper script (interactive):**
   ```bash
   ./cran-release.sh
   ```
   
   **Option B: Manual commands:**
   ```bash
   # Build the package
   R CMD build .
   
   # Check the package
   R CMD check --as-cran doctest_0.4.0.tar.gz
   ```
   
   **Option C: Use R directly:**
   ```r
   # Install required packages if needed
   install.packages(c("devtools", "rcmdcheck", "urlchecker"))
   
   # Build the package
   devtools::build()
   
   # Check the package
   rcmdcheck::rcmdcheck(args = c("--no-manual", "--as-cran"))
   
   # Check URLs
   urlchecker::url_check()
   ```

4. **Submit to CRAN:**
   - Go to: https://cran.r-project.org/submit.html
   - Upload: `doctest_0.4.0.tar.gz`
   - Use the message template from `CRAN-SUBMISSION-MESSAGE.md`

## Files in This Release

| File | Purpose |
|------|---------|
| `DESCRIPTION` | Package metadata with version 0.4.0 |
| `NEWS.md` | Release notes and changelog |
| `cran-comments.md` | Testing information for CRAN reviewers |
| `CRAN-RELEASE.md` | Comprehensive release checklist and guide |
| `CRAN-SUBMISSION-MESSAGE.md` | Template message for CRAN submission |
| `cran-release.sh` | Helper script for building and checking |

## GitHub Actions Workflows

The package uses r-lib/actions@v2 for automated testing:

### R-CMD-check.yaml
- Runs on: macOS, Windows, Ubuntu
- R versions: devel, release, oldrel-1
- Uses: `setup-r`, `setup-r-dependencies`, `check-r-package`

### pkgdown.yaml
- Builds documentation website
- Deploys to GitHub Pages

### test-coverage.yaml
- Measures code coverage
- Reports to Codecov

## Pre-submission Checklist

- [x] Version number updated to 0.4.0
- [x] NEWS.md updated with release notes
- [x] cran-comments.md updated with test results
- [ ] All GitHub Actions checks pass
- [ ] URLs checked and valid
- [ ] Package builds without errors
- [ ] R CMD check --as-cran passes with 0 errors, 0 warnings, 0 notes
- [ ] Package tarball created
- [ ] Submission message prepared

## Testing Platforms

As documented in `cran-comments.md`, testing is performed via GitHub Actions on:

- macOS-latest (R release)
- Windows-latest (R release)
- Ubuntu-latest (R devel, release, oldrel-1)

## Documentation

- Package website: https://hughjonesd.github.io/doctest/
- GitHub repository: https://github.com/MLopez-Ibanez/doctest
- Bug reports: https://github.com/hughjonesd/doctest/issues

## After CRAN Acceptance

1. Create a GitHub release with tag `v0.4.0`
2. Update DESCRIPTION to `0.4.0.9000` for development
3. Add "# doctest (development version)" section to NEWS.md
4. Monitor CRAN check results page
5. Respond to any user feedback

## Support

For questions about the release process:
- Review: `CRAN-RELEASE.md` (detailed guide)
- Check: GitHub Actions results
- Contact: Package maintainer

---

**Note:** The GitHub Actions workflows use the latest r-lib/actions@v2, which follows CRAN best practices for package checking and testing.
