# KDB-Tests

1. docker build -t kdb-perf-test . --no-cache
2. docker run -d --rm -v $(pwd):/opt/kdb/testfiles --name kdb-server kdb-perf-test