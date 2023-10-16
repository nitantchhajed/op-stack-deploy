This repo contains files and documentations to host your own OP-Stack chain using Docker.
as Docker is much more reliable way to host your blockchain instead of running it locally and exposing the ports through hosting services like nginx/apache2

This repo also contains scripts to set up the docker and get the geth datadir from existing node server.

The heartbeat identifier detects the RPC health from sequencer node constantly with the help of cron job and if RPC health status is false then it will convert that particular validator node with sequencer.enabled into a sequencer node. 