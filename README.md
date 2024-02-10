![CI](https://github.com/hyperifyio/test/actions/workflows/ci.yml/badge.svg)

**Join our [Discord](https://discord.gg/UBTrHxA78f) to discuss about our software!**

# @hyperifyio/test

This is a unit test environment for our TypeScript libraries.

Our own projects usually require very few dependencies. Adding all testing tools
would add over 300 dependencies to our projects, which can be burdensome.
Instead, we have created this separate testing environment to keep our projects
lightweight while still providing a comprehensive testing environment.

This separation also makes it easier to run newer tests against older versions
of the project to test backwards compatibility.

## Working on the Development Environment

### Fetching the Source Code

To get started, clone the repository and initialize the submodules:

```bash
git clone git@github.com:hyperifyio/test.git test
cd test
git submodule update --init --recursive
```

### Updating the Source Code Modules

Next, install the necessary dependencies:

```bash
npm install
```

### Clearing the Cache

There may be instances where you need to clear the cache, such as when you 
encounter errors about non-existent files. To clear the cache, run the following 
command:

```bash
npm run clear
```

This will remove any cached files and allow you to start fresh. Note that this 
may cause some tasks to take longer to run the next time they are executed, as 
the system will need to rebuild the cache from scratch.

### Updating source code modules

To update the source code modules to the latest version, run:

```bash
./scripts/pull-all.sh
```

## Libraries

| Repository                                                                                 | Summary                         |
|--------------------------------------------------------------------------------------------|---------------------------------|
| [@hyperifyio/io.hyperify.core](https://github.com/hyperifyio/io.hyperify.core)             | The core module                 |
| [@hyperifyio/io.hyperify.node](https://github.com/hyperifyio/io.hyperify.node)             | The backend and NodeJS module   |
| [@hyperifyio/io.hyperify.frontend](https://github.com/hyperifyio/io.hyperify.frontend)     | The frontend and ReactJS module |
| [@hyperifyio/io.hyperify.pg](https://github.com/hyperifyio/io.hyperify.pg)                 | The PostgreSQL module           |
| [@hyperifyio/io.hyperify.mysql](https://github.com/hyperifyio/io.hyperify.mysql)           | The MySQL module                |
| [@hyperifyio/io.hyperify.testing](https://github.com/hyperifyio/io.hyperify.testing)       | The testing module              |

## Running Tests

To run the tests once:

```
npm run test:ci
```

While developing code, you can use the following command to continuously run 
tests as you make changes:

```
npm test
```

## Development with GitHub Using SSH

To use SSH when working with submodules in this repository, you will need to 
configure your Git settings as follows:

```
git config --global url."git@github.com:hyperifyio/".insteadOf "https://github.com/hyperifyio/"
```

This configuration is necessary because the repository uses HTTPS links for
read-only access. However, you may prefer to use SSH when pushing and pulling 
changes.

## License

Copyright (c) Heusala Group Ltd. All rights reserved.

Each software release is initially under the HG Evaluation and 
Non-Commercial License for the first two years. This allows use, modification, 
and distribution for non-commercial and evaluation purposes only. Post this 
period, the license transitions to the standard MIT license, permitting broader
usage, including commercial applications. For full details, refer to the 
[LICENSE.md](LICENSE.md) file. 

**Commercial usage licenses can be obtained under separate agreements.**
