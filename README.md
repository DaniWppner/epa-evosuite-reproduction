# EPA-EvoSuite Reproduction Environment

This repository provides a Docker-based setup to reproduce the experiments from [EPA-EvoSuite](https://github.com/j-godoy/epa-evosuite).

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/)

## Setup Instructions

1. **Clone the EPA Benchmark repository**

   ```bash
   git clone https://github.com/j-godoy/epa-benchmark.git
   ```

2. **Apply provided patches**

   Apply `config_example.ini.patch` and `runs_example.ini.patch` as follows:

   ```bash
   cd epa-benchmark
   git apply ../config_example.ini.patch
   git apply ../runs_example.ini.patch
   cd ..
   ```

3. **Edit the `docker-compose.yml` file**

   Update the `volumes` section so that the local path points to the location of your cloned `epa-benchmark` directory.  
   Example:

   ```yaml
   volumes:
     - /absolute/path/to/epa-benchmark:/replication-package/epa-benchmark
   ```

4. **Build and start the container**

   ```bash
   docker compose up -d
   ```

5. **Access the running container**

   ```bash
   docker exec -it javigod-epa-evosuite bash
   ```

6. **Navigate to the benchmark directory inside the container**

   ```bash
   cd /replication-package/epa-benchmark
   ```

7. **Run the experiment script**

   ```bash
   python3 script.py config_example.ini runs_example.ini
   ```
