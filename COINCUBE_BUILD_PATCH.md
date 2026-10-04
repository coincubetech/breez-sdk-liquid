# COINCUBE build-only adaptation of Liquid SDK 0.12.2

Base: 94e1e184ca9a0a0cfaa0a61a04d5c28cad45e991.

Remove the unavailable regtest/swapproxy-service/swapproxy gitlink and its .gitmodules entry so Cargo can fetch this revision. The referenced upstream repository returns 404 with available access. Cargo recursively fetches submodules even though this regtest service is not part of the SDK crate build.

That adaptation changed no SDK Rust source, dependency manifest, or other submodule. SDK regtest environments requiring swapproxy remain unavailable; this does not replace or claim to repair that service. Restore the original gitlink and entry when a verified source for a6c9f2200277c0395a23f3f9a30ec4b9b6536714 becomes available.

## Standalone CI dependency recovery

The SDK workspace and Flutter manifest now fetch `sdk-common` and `sdk-macros`
from `coincubetech/breez-sdk` at the original commit
`113749fd36dd7a20358dc40526c4a30147f8c1a8`. The upstream `breez/breez-sdk`
source is unavailable. This is the same exact-commit mirror already used by the
COINCUBE desktop workspace. The library, CLI, and Flutter lockfiles retain their
package versions and commit pins; only the source URLs change.

The dependency is changed in the manifests themselves so standalone consumers
also resolve it without needing a root-level Cargo patch. This does not restore
the missing swapproxy regtest service or imply that the full regtest environment
is operational.
