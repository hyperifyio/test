// Copyright (c) 2023-2024. Heusala Group Oy <info@hg.fi>. All rights reserved.

/**
 * The scope of tests to perform.
 *
 * 2. `unit`: Unit tests for Hyperify.io project
 * 3. `system`: Full system tests which require real running system
 * 4. `integration`: There is also a special scope "integration" which will enable MySQL and PostgreSQL
 *                  integration tests against a full server. To run these, you need to install
 *                  `mysql` and/or `pg` NPM modules and provide configuration parameters.
 *
 * @type {string[]}
 */
const TEST_SCOPES = (process.env.TEST_SCOPES??'unit,system').split(/[ ,|;:\t]+/).map(item => item.toLowerCase());

/**
 * The default timeout of the tests
 *
 * @type {number}
 */
const TEST_TIMEOUT = parseInt(process.env.TEST_TIMEOUT ?? '300000', 10);

/** @type {import('@ts-jest/dist/types').InitialOptionsTsJest} */
module.exports = {
  projects: [
    ...(TEST_SCOPES.includes('unit') || TEST_SCOPES.includes('integration') ? [
      "./src/io/hyperify/core",
      "./src/io/hyperify/node",
      "./src/io/hyperify/frontend",
      "./src/io/hyperify/mysql",
      "./src/io/hyperify/pg",
    ]: [])
  ],
  collectCoverageFrom: [
    '**/*.{ts,tsx}',
    '!**/node_modules/**',
  ],
  coverageDirectory: './coverage',
  testTimeout: TEST_TIMEOUT,
  setupFilesAfterEnv: [
    "./src/io/hyperify/testing/jest/matchers/index.ts"
  ]
};
