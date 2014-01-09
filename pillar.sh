VM_EXECUTABLE=./pharo-ui

command=$1
shift

# disable parameter expansion to forward all arguments unprocessed to the VM
set -f

exec $VM_EXECUTABLE Pharo.image pillar "$command" --baseDirectory="$(pwd)" "$@"
