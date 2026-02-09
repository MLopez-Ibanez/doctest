# CRAN Submission Message for doctest 0.4.0

## For CRAN submission form

### Package: doctest
### Version: 0.4.0
### Maintainer: David Hugh-Jones <davidhughjones@gmail.com>

---

## Submission Message

Dear CRAN maintainers,

I am submitting version 0.4.0 of the doctest package.

### What's new in this version

This release improves the quality of generated tests by not producing "Source line" information, which avoids changes irrelevant to examples from modifying the tests.

### Testing

The package has been thoroughly tested on multiple platforms using GitHub Actions with r-lib/actions@v2:

- **macOS-latest** (R release)
- **Windows-latest** (R release)
- **Ubuntu-latest** (R devel)
- **Ubuntu-latest** (R release)
- **Ubuntu-latest** (R oldrel-1)

All checks pass with **0 errors, 0 warnings, and 0 notes**.

The continuous integration setup uses:
- `r-lib/actions/setup-r@v2` for R installation
- `r-lib/actions/setup-r-dependencies@v2` for dependency management
- `r-lib/actions/check-r-package@v2` for comprehensive package checking with CRAN standards

GitHub Actions results are available at: https://github.com/MLopez-Ibanez/doctest/actions

### Compatibility

- This release maintains backward compatibility with previous versions
- No breaking changes introduced
- All existing functionality preserved

### Reverse Dependencies

No reverse dependencies were found on CRAN at the time of this submission.

### Additional Information

- Package documentation: https://hughjonesd.github.io/doctest/
- Bug reports: https://github.com/hughjonesd/doctest/issues
- License: MIT + file LICENSE

Thank you for your time and consideration in reviewing this submission.

Best regards,
David Hugh-Jones

---

## Post-submission checklist

After CRAN acceptance:

- [ ] Create GitHub release with tag v0.4.0
- [ ] Verify pkgdown website updates automatically
- [ ] Monitor CRAN check results page
- [ ] Watch for user feedback and issues
- [ ] Update development version to 0.4.0.9000 in DESCRIPTION
- [ ] Add "# doctest (development version)" section to NEWS.md
