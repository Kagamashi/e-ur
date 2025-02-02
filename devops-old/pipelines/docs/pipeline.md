Continuous Integration [CI] : automatically integrating code changes from multiple contributors into a shared repository
- Azure Pipelines automates building and testing of our app whenever new code is commited to repository

Conitnuous Deployment [CD] : automating the deployment of applications to various environments: development, staging, production.
- automatic deployment to cloud platforms



Hosted Agents
- pre-configured virtual machines maintained by Microsoft
- comes with pre-installed software (.NET, Node.js, Python, Docker etc.)

Self-Hosted Agents
- can be physical machines, VMs, containers
- we have to configure and maintain the agent



Agent Pool : collection of agents that pipelines can run jobs on.
- when we run a pipeline it picks an available agent from the pool to execute the job

Parallelism : ability to run multiple jobs concurrently across different agents within a pool
- hosted agents: limited number of parallel jobs for free
- self-hosted agents: number of parallelism depends on the number of machines in our agent pool

Scenarios for using Agent Pools/Parallelism:
- LARGE PROJECTS where we want to run tests, builds, deployments in parallel to reduce overall time
- MULTI-ENV SETUP where each env is served by different agent pool
- CUSTOM HARDWARE/SOFTWARE DEPENDENCIES where certain agents are configured with specific tools



Build Pipeline : automates the process of compiling code, running tests, and producing artifacts (e.g., binaries, packages) that are later deployed.

Release Pipeline : handle deployment process to different environments (e.g. development, staging, production).
 
Multi-stage pipelines allow to combine both build and release stages into a single YAML pipeline.

Artifact Storage : Artifacts are the output of build pipelines and are stored for use in the release stages. They can be deployed to various environments or stored in package managers.

Deployment Strategies : Different strategies such as rolling deployments, blue/green, and canary deployments provide flexibility in how code is released to environments, allowing for safer and faster releases.



