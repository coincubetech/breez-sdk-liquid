# COINCUBE build-only adaptation of Liquid SDK 0.12.2

Base: 94e1e184ca9a0a0cfaa0a61a04d5c28cad45e991.

Remove the unavailable regtest/swapproxy-service/swapproxy gitlink and its .gitmodules entry so Cargo can fetch this revision. The referenced upstream repository returns 404 with available access. Cargo recursively fetches submodules even though this regtest service is not part of the SDK crate build.

No SDK Rust source, dependency manifest, or other submodule is changed. SDK regtest environments requiring swapproxy remain unavailable; this does not replace or claim to repair that service. Restore the original gitlink and entry when a verified source for a6c9f2200277c0395a23f3f9a30ec4b9b6536714 becomes available.
