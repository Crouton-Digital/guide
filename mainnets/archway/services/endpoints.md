```bash
# Prune Type
pruning = "custom"

# Prune Strategy
pruning-keep-recent = "40000"
pruning-keep-every = "2000"
pruning-interval = "17"

# State-Sync Snapshot Strategy
snapshot-interval = 2000
snapshot-keep-recent = 2

# Indexer Configuration
indexer = "kv"
```

```http
RPC:      https://rpc-archway-main.crouton.digital
API:      https://api-archway-main.crouton.digital
gRPC:     http://grpc-archway-main.crouton.digital:9690
gRPC-web: http://grpc-web-archway-main.crouton.digital:9691
peer:     d57bbeb22b4a98fcbdb5c440769ea46206d7ccfb@peer-archway-main.crouton.digital:27256
```
