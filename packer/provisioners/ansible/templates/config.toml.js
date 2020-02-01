[parity]
mode = "last"
mode_timeout = 300
mode_alarm = 3600
auto_update = "critical"
release_track = "current"
public_node = false
no_download = false
no_consensus = false
no_persistent_txqueue = false

chain = "homestead"
base_path = "$HOME/.local/share/io.parity.ethereum"
db_path = "$HOME/.local/share/io.parity.ethereum/chains"
keys_path = "$HOME/.local/share/io.parity.ethereum/keys"
identity = ""
light = false

[account]
unlock = ["0xdeadbeefcafe0000000000000000000000000000"]
password = ["/home/user/.safe/password.file"]
keys_iterations = 10240
enable_signing_queue = false

[network]
port = 30303
min_peers = 25
max_peers = 50
nat = "any"
id = 1
bootnodes = []
discovery = true
warp = true
allow_ips = "all"
snapshot_peers = 0
max_pending_peers = 64
no_serve_light = false

reserved_only = false
reserved_peers = "./path_to_file"

[rpc]
disable = false
port = 8545
interface = "local"
cors = []
apis = ["web3", "eth", "pubsub", "net", "parity", "parity_pubsub", "traces", "rpc", "shh", "shh_pubsub"]
hosts = ["none"]

[websockets]
disable = false
port = 8546
interface = "local"
origins = ["none"]
apis = ["web3", "eth", "pubsub", "net", "parity", "parity_pubsub", "traces", "rpc", "shh", "shh_pubsub"]
hosts = ["none"]

[ipc]
chmod = 775
disable = false
path = "$HOME/.local/share/io.parity.ethereum/jsonrpc.ipc"
apis = ["web3", "eth", "pubsub", "net", "parity", "parity_pubsub", "parity_accounts", "traces", "rpc", "shh", "shh_pubsub"]

[dapps]
disable = false
path = "$HOME/.local/share/io.parity.ethereum/dapps"

[secretstore]
disable = false
nodes = []
http_interface = "local"
http_port = 8082
interface = "local"
port = 8083
path = "$HOME/.local/share/io.parity.ethereum/secretstore"

[ipfs]
enable = false
port = 5001
interface = "local"
cors = []
hosts = ["none"]

[mining]
author = "0xdeadbeefcafe0000000000000000000000000001"
engine_signer = "0xdeadbeefcafe0000000000000000000000000001"
force_sealing = true
reseal_on_txs = "all"
reseal_min_period = 4000
reseal_max_period = 60000
work_queue_size = 20
relay_set = "cheap"
usd_per_tx = "0.0025"
usd_per_eth = "auto"
price_update_period = "hourly"
gas_floor_target = "4700000"
gas_cap = "6283184"
tx_queue_size = 8192
tx_queue_gas = "off"
tx_queue_strategy = "gas_factor"
tx_queue_ban_count = 1
tx_queue_ban_time = 180 #s
tx_gas_limit = "6283184"
tx_time_limit = 100 #ms
extra_data = "Parity"
remove_solved = false
notify_work = ["http://localhost:3001"]
refuse_service_transactions = false

[stratum]
disable = false
interface = "local"
port = 8008
secret = "p4ssw0rd"

[footprint]
tracing = "auto"
pruning = "auto"
pruning_history = 64
pruning_memory = 32
cache_size_db = 128
cache_size_blocks = 8
cache_size_queue = 40
cache_size_state = 25
cache_size = 128 # Overrides above caches with total size
fast_and_loose = false
db_compaction = "ssd"
fat_db = "auto"
scale_verifiers = true
num_verifiers = 6

[snapshots]
disable_periodic = false

[vm]
jit = false

[misc]
logging = "own_tx=trace"
log_file = "/var/log/parity.log"
color = true

