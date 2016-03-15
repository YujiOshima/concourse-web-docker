# Concourse CI Web Docker Image

This image is used to run the [ATC](https://github.com/concourse/atc), web UI and build scheduler alongside a [TSA](https://github.com/concourse/tsa).

## Building the Docker image

To build the `vyshane/concourse-web` docker image, run:

```
./build.sh
```

## Configuration

The following environment variables are available for configuration.

Environment Variable | Description
--- | ---
BASIC_AUTH_USERNAME | Defaults to `ci`
BASIC_AUTH_PASSWORD | Defaults to `password`
SESSION_SIGNING_KEY | Path to the session signing private key file. Currently must be RSA. Used for signing user session tokens, and by the TSA to sign its own tokens in the requests it makes to the ATC.
TSA_HOST_KEY | Path to the TSA host key file. Used for the TSA's SSH server. This is the key whose fingerprint you see when the ssh command warns you when connecting to a host it hasn't seen before.
TSA_AUTHORIZED_KEYS | Path to the TSA's authorized_keys file. Contains the public keys of the workers that are authorized to connect to the TSA.
POSTGRES_HOST | PostgreSQL database host where ATCs will persist and share their scheduling workloads.
POSTGRES_PORT | Port where the PostgreSQL database is listening. Defaults to 5432.
POSTGRES_USERNAME | Username to use when authenticating with PostgreSQL
POSTGRES_PASSWORD | Password to use when authenticating with PostgreSQL
EXTERNAL_URL | URL where ATCs can be reached. E.g. the URL of a load balancer.
PEER_URL | URL used to reach this individual ATC, from other ATCs, i.e. a URL usable within their private network.

See the [Concourse binary distribution documentation](https://github.com/concourse/bin#prerequisites) for more information regarding keys.