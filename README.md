# AWS-backed Vagrant using Docker

Manage AWS instances using the Vagrant client, running in Docker.

Build:

    $ docker build -t aws-vagrant .

And make any desired edits to the Vagrantfile.

Now run:

    $ docker run \
             --rm \
             -ti \
             -v "$PWD:/app" \
             -v "$HOME/.ssh:/app/ssh" \
             -e AWS_ACCESS_KEY_ID \
             -e AWS_SECRET_ACCESS_KEY \
             -e AWS_SESSION_TOKEN \
             aws-vagrant \
             vagrant up --provider=aws

The last line is the actual vagrant command, run inside docker.

This assumes you have the AWS credentials in the environment. If they live in
your `~/.aws` directory instead, use this:

    $ docker run \
             --rm \
             -ti \
             -v "$PWD:/app" \
             -v "$HOME/.ssh:/app/ssh" \
             -v "$HOME/.aws:/root/.aws" \
             aws-vagrant \
             vagrant up --provider=aws

(actually I'm not 100% on whether that works. you might need to play around with
the Vagrantfile a bit.)
