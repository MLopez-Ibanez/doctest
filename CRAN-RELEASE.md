# CRAN Release Checklist for doctest 0.4.0

This document outlines the steps to release version 0.4.0 to CRAN using the r-lib/actions GitHub Actions workflows.

## Pre-release Checklist

- [x] Version number updated in DESCRIPTION (0.4.0)
- [x] NEWS.md updated with changes for version 0.4.0
- [x] cran-comments.md updated with testing platforms and results

## Running Checks via GitHub Actions

The repository uses r-lib/actions@v2 for comprehensive testing:

### 1. R CMD Check (Multiple Platforms)

GitHub Actions workflow `.github/workflows/R-CMD-check.yaml` automatically runs on:
- macOS-latest (R release)
- Windows-latest (R release)
- Ubuntu-latest (R devel)
- Ubuntu-latest (R release)
- Ubuntu-latest (R oldrel-1)

This workflow uses:
- `r-lib/actions/setup-r@v2` - Install R
- `r-lib/actions/setup-r-dependencies@v2` - Install package dependencies
- `r-lib/actions/check-r-package@v2` - Run R CMD check with CRAN settings

**To trigger:** Push to main/master branch or create a pull request.

### 2. URL Checking

To check URLs in documentation (as CRAN does), you can run locally:

```r
# Install urlchecker if needed
install.packages("urlchecker")

# Check URLs
urlchecker::url_check()
```

Or add a GitHub Actions workflow for URL checking.

## Building the Source Package

### Option 1: Using R CMD build (Recommended)

```bash
cd /path/to/doctest
R CMD build .
```

This creates `doctest_0.4.0.tar.gz` in the current directory.

### Option 2: Using devtools

```r
# In R
devtools::build()
```

### Option 3: Using GitHub Actions

The `check-r-package@v2` action automatically builds the package as part of its checks.
You can download the built package from the GitHub Actions artifacts.

## Running CRAN Checks Locally

If you have all dependencies installed:

```r
# Install rcmdcheck if needed
install.packages("rcmdcheck")

# Run CRAN checks
rcmdcheck::rcmdcheck(args = c("--no-manual", "--as-cran"))
```

## Checking the Built Package

After building, verify the package:

```bash
R CMD check --as-cran doctest_0.4.0.tar.gz
```

## Submission to CRAN

### 1. Review GitHub Actions Results

Before submitting, ensure all GitHub Actions checks pass:
- Go to: https://github.com/MLopez-Ibanez/doctest/actions
- Verify R-CMD-check workflow shows all green checkmarks
- Review any warnings or notes

### 2. Submit to CRAN

Visit: https://cran.r-project.org/submit.html

Upload:
- `doctest_0.4.0.tar.gz` (built source package)

### 3. CRAN Submission Message Template

```
Dear CRAN maintainers,

I am submitting version 0.4.0 of the doctest package.

## What's new in this version

This release improves the quality of generated tests by not producing 
"Source line" information, which avoids changes irrelevant to examples 
from modifying the tests.

## Testing

The package has been tested on multiple platforms using GitHub Actions 
with r-lib/actions@v2:
- macOS-latest (R release)
- Windows-latest (R release)  
- Ubuntu-latest (R devel)
- Ubuntu-latest (R release)
- Ubuntu-latest (R oldrel-1)

All checks pass with 0 errors, 0 warnings, and 0 notes.

## Compatibility

This release maintains backward compatibility with previous versions.

Thank you for your time and consideration.

Best regards,
[Your Name]
```

## Post-submission

After CRAN acceptance:
1. Create a GitHub release with tag v0.4.0
2. The pkgdown website will automatically update via GitHub Actions
3. Monitor for any user-reported issues

## References

- GitHub Actions workflows: `.github/workflows/`
- r-lib/actions documentation: https://github.com/r-lib/actions
- CRAN submission page: https://cran.r-project.org/submit.html
- CRAN policies: https://cran.r-project.org/web/packages/policies.html
