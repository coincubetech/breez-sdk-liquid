# Regtest swapproxy source

The `swapproxy/` directory is an unmodified source snapshot from
https://github.com/breez/swapproxy at commit
`a6c9f2200277c0395a23f3f9a30ec4b9b6536714`, the original SDK submodule pin.
It was recovered from the local Git object cache because that remote is
unavailable. All tracked files, including the original GPL-3.0 license, are
preserved. This standalone regtest service is built in its own Docker image;
it is not linked into the SDK or included in its Cargo workspace.

The snapshot replaces the removed gitlink so fresh clones can build the same
regtest service without fetching the unavailable repository.
