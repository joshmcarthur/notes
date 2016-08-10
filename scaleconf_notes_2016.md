## ScaleConf Summary Notes:

### Nick Walker - Vend:

Nick talked about debugging services at Vend (not necessarily microservices). He talked about a Go debugging tool named [pprof](https://golang.org/pkg/net/http/pprof/). At Vend, pprof is enabled on all production services, as it apparently provides a lot of assistance when debugging goroutines (each request runs in a goroutine so the request/response is asynchrous).

During Vend's docker experimentation, they also noticed a discrepency in request/response time. The total time spend for each microservice did not add up to the total request time. They spent some time trying to track down this issue before discovering the latency was coming from Docker, which was running a proxy process in front of each docker host - apparently for RHEL 6 compatibility. Nick said that this option could be safely disabled on all non-RHEL 6 container hosts with the `--userland-proxy false` flag. There is [an active pull request](https://github.com/docker/docker/issues/14856) to have this feature disabled by default.

Nick also mentioned a tool that Vend (might?) be using across their SOA called [Kong](https://getkong.org/). Not much more comment on this, but it looks neat - probably a similar feature set to Nginx though.

When discussing monitoring, Nick talked about the benefits of generating a request ID at the edge of an application's infrastructure, and keeping this request ID persisted throughout the lifetime of the request. This is less important for monolithic apps, but makes it significantly easier to track requests' movements through microservices.

### Paul Stack - Hashicorp:

Paul was talking about continuous deployment of services. Hashicorp is a pretty neat company that works on the development of Vault, Vagrant, and Terraform, though Paul is fairly new to the company. I don't have many notes from the early parts of Paul's talk, except for a book he recommended named [The Phoenix Project](https://www.amazon.com/Phoenix-Project-DevOps-Helping-Business-ebook/dp/B00AZRBLHO), which looked like a friendly approach to discussing ops. Paul mentioned he dislikes companies using the 'x' deploys a day, as at the end of the day, the only thing that matters is that deployments are 'at will.

Part of Paul's slides identified three goals that really resonated with me:

1. Disposable infrastructure: basically the AWS approach of treating any infrastructure that services are running on as stateless and able to be torn down, recreated, or modified at any time.
2. Centralized logging: streaming logs from all services into a single location can greatly aid in recognizing performance problems and tracking down bugs.
3. Defined metrics and monitoring strategy: adding metrics early on to an application is not hard, but it does need to be intentionally done. Instrumenting and defining monitors for key areas of an app, but particularly around external dependencies and calling other services can be coded in early on and collected immediately, and then graphed and presented when required.

With all of the above goals accomplished, orchestration is possible. This involved using tools such as Hashicorps own Terraform to automatically manage instructure, with logs streaming to a central location and metrics being collected and trigging monitoring alerts with performance drops.

Paul had a really neat screenshot of a monitoring dashboard from a previous job that I thought was really neat. There were a tonne of metrics, but the area that really caught my eye was a table of most-requested URIs for the last 24 hour period - that was a kind of metric I hadn't really considered before, but actually seemed like a great way of seeing the kind of traffic an app was receiving.

> This talk gave me the idea that templating out some examples of how to instrument a Rails application for metric collection,
> and agreeing on a set of monitoring tools could really benefit Rabid, as this whole area is something we could improve on. Paul mentioned that he helped out teams with this by providing templates along with coaching individual teams.

### Richard Busby - AWS

Richard's talk must have been interesting, because I don't have many notes for this one. From memory, Richard summarized the history of Amazon, and particularly AWS, covering off their origins as a bookstore and their approach to starting of internal products with "2 pizza teams" (feed the team with 2 pizzas). All AWS services start like this, with teams being split into functional areas as a service grows (for example, I would imagine there are multiple 2 pizza teams working on S3, but broken into CORS, static website hosting, file storage etc). Richard mentioned that all significant new changes at Amazon start off written as 'press releases' that are distributed internally then reviewed. He said that this encourages leaders to build a narrative around a new idea and have it challenged early on.

On a technical level, he also briefly talked about Amazon's heavily service driven approach - while Amazon started off as a monolithic app, early on they began working to break distinct sercices off into microservices. This actually caused AWS to come about, since each of these smaller services required databases, file storage, compute etc to be provisioned for them. Apparently, each visit to the Amazon home page triggers a hit on around 300 different services.

Someone asked a great follow up question about how to deal with chaining with that many services. Richard replied that each item in the chain should be examined to see if it is necessary - for example, if the homepage is going through an billing service to get to user information, why not go directly to a profile service?

### Dustin Whittle - Uber

Dustin followed up some great talks about _why_ performance monitoring is important with the _how_. I was originally a bit dubious about this talk as he seemed to be covering really basic stuff, but he had some interesting insights around HTTP/2 - for example that many of the optimisation patterns for HTTP 1.1 (concatenating, different asset hosts etc) are actually going to be come antipatterns, as parts of HTTP/2 are specifically designed to improve these performance issues in a more efficient way. He had some really interesting numbers as well about the perception of performance from a user's perspective:

* 100ms - appears to be instantaneous
* 100-300ms - noticable delay, but does not get in the way of the user
* 1 second - breaks the thought flow of the user
* 2 seconds - the longest a typical user is expecting to wait.

He also emphasized that these times are not request times, but the time until content appears on the page - so hitting these targets can be very challenging for most applications.

He had a bunch of interesting links, the ones I've noted down are:

* [HTML5 Boilerplate Nginx config files](https://github.com/h5bp/server-configs-nginx): a neat collection of Nginx configs for ensuring content is served in an optimised manner. There's also [Mozilla's SSL config generator](https://mozilla.github.io/server-side-tls/ssl-config-generator/). **Action point:** trawl through these and submit pull requests for our Nginx config files managed by Chef to make some improvements - particularly with the SSL configs.
* [Nginx pagespeed module](https://github.com/pagespeed/ngx_pagespeed) more for apps that can't or won't make performance improvements - probably something for us to put in front of a legacy application, since our build process takes care of most of the optimisation steps this module does (such as compression and minification).

In terms of performance monitoring, the links that Dustin mentioned that I haven't come across before are:

* [Boomerang.js](http://www.lognormal.com/boomerang/doc/) - collects a bunch of metrics for end-user experience that can be sent to analytics, metrics service etc.
* A link to a book on HTTP2 that looked interesting - I missed the slide with the link but have written down "hpai.com/http2" - but that is not the right URL: **Action point:** do some Googling, try and find it.

### Alvaro Videla - RabbitMQ

A really great, enthusiastic, hard to follow talk on distributed systems. Mostly focussed on the theory behind any distributed system and how achieving "consensus" is actually a very difficult mathmatical problem - maybe impossible. Also cleared up some confusion when distributed systems talk about "synchrous" vs "asynchrous" - they're not talking about programming language execution style, "synchrous" means that a network is absolutely perfect with no failure, delay, and the timing of the request is exactly known - obviously an impossibility in the real world but often used by researchers to detemine whether a particular criteria is _theoretically_ possible. Seemed to mention that Raft seemed like a pretty safe approach to use but RabbitMQ does not currently use it.

### Bethany Macri - Etsy

Etsy seems to be pretty much the place to work if you're an ops person. Bethany was talking about Etsy's change from a V2 to a V3 API. Their V2 API sounds like it was a jsonapi-resources type thing - they had basically JSON endpoints bound to particular model schemas, with `include` and sparse fieldset support. This was great, they had lots of apps and mobile apps using this, but they found particularly with include that it made consistent endpoint support difficult - someone could request a bunch of relationships be included and it would cause the request to spike in their monitoring.

Their V3 API introduced two concepts - bespoke and components. It _sounds_ like components was basically the v2 API, but in a flat structure with the include support removed. the Bespoke component involved some custom templating to build API endpoints for each client - for example if the mobile app needed a response containing information about a listing, a store and the store owner, a special endpoint would be dedicated to that client. They got this idea from pairing at Netflix, who have a similar problem needing to support a huge range of devices. The key improvement for Bespoke, apart from the improvements for clients, is that even though it re-uses the component (v2-style) API, it doesn't duplicate code, and it's very fast, because the component API requests stay in the same data center as where the bespoke API is being served from - this is much more efficient than clients either doing a single request joining a bunch of associations, or performing serveral HTTP requests to get all the information needed to present a particular view.

Bethany also covered Etsy's data transformation early on. They started as a single PHP app talking to a single PG instance (sounds like it was replicated though). Eventually they could not vertically scale this instance any more, so they looked at sharding. They did sharding in quite a cool way - they have an ID service that has two tables - 'A' and 'B'. Both tables have an auto-incrementing primary key, incrementing by 2 each time - but A started with even numbers, and B started with odd numbers. This way they can get a globally unique ID that is still sequenced and easy to reference. A neat alternative to UUIDs. I didn't quite catch _how_ they sharded, but I know they ended up in a structure where they had many shards, with each shard having 2 masters replicating to one another. Bethany covered this to explain how they could run database migrations easily by taking each master out in turn, running the migration, and reintroducing it to the shard.

### Donovan Jones - Catalyst

Kind of interesting talk about the architecture of TAB.co.nz - [four tier app](https://www.nginx.com/blog/time-to-move-to-a-four-tier-application-architecture/). This actually sounded like quite a neat idea, albeit applied to a terrible cause.

1. clients
2. Delivery
3. Aggregation
4. Services

Really, most apps at Rabid just deal with clients and services, with aspects of delivery and aggregation mashed into one or the other. He talked about clients being different platforms - for example native apps and responsive HTML. These types of clients are decoupled from the backend, but have Seo challenges and JS architecture concerns. Delivery basically covers the build and networking process. He rattled off a bunch of things but then went on to say that Cloudflare takes care of them all and that's what TAB does. Aggregation is a gateway to services - for example, handling API rate limiting, access control, and perhaps routing to different services. He mentioned a cool little go binary that could be used for the routing: http://traefik.io/. Looks similar to kong. Services can be microservices or a monolith.

**Action point:** review Kong and Trafik in more depth. Figure out how a monolithic microservice architecture would work with Phoenix.

### John  Clegg - Xero:

Pretty interesting talk about Xero's weird action squad thing that they have to measure performance and make improvements. Basically a cross-functional team. They help development teams do performance measurement and sit between the devs and the management team to sell mgmt on improvements. They also seem to be involved in build process and failing builds if performance isn't up to scratch. John mentioned [Github's Scientist library](https://github.com/github/scientist) which was referred to by several people for refactoring legacy code, and also had a discussion about feature flags.

**Action point:** I had a discussion with Eoin afterwards about how feature flag support should be included in all Rabid projects. They're not just useful for controlling rollout of a feature, they're also great for encouraging developers to build features that can be turned off if they are causing problems, or just to give the client flexibility - e.g. turn off commenting, turn off purchasing.

### Jonah Kowall - AppDynamics:

Good monitoring overview talk from Jonah, but some inherent bias from the fact he's from a monitoring company. He first set out some casual agile info, of which I picked up something major:

---

**AGILE TEAMS SHOULD ALWAYS BE CROSS-FUNCTIONAL**

---

I caught onto this because it seemed a perfect encapsulation of the problems identified in the small projects retro - these projects are harmful because the teams are _not_ cross-functional, placing a lot of responsibility on the developer to be responsible for delivering an acceptable quality solution at all levels - UI, UX, architecture as well as actual feature delivery.

Jonah also talked about some common issues microservices have, notably:

* Fragmentation
* Coordination
* Consistent development practises/quality standards/SLAs
* Running microservices is quite a shift from "standard devops"

He also talked about "miniservices", which is a way of supporting legacy monoliths. Basically the idea is to fence off a monolith, adding any new features as microservices, and adding API access to the monolith if possible. Interesting idea.

He also discussed monitoring microservices. I have a handy slide listing the different open source options for monitoring docker containers specifically, but he recommended Prometheus + Grafana - with the caveat that it does not have transaction tracing through services and end-user monitoring. There is a service for providing transaction tracing through microservices called [Zipkin](https://github.com/openzipkin/zipkin).


### Graham Dumpleton - RedHat

Graham was talking about containerization, docker, kubernetes and OpenShift. Looked really, really cool, and the sort of thing I'd like to see Rabid getting into. OpenShift + Kubernetes takes care of orchestrating, scheduling, load balancing, building and deploying docker containers (Kubernetes basically the first 4 of those). The RedHat OpenShift part started off supporting the concept of containers, just not Docker ones - they're gone all in supporting docker due to it's popularity.

Graham really hit the nail on the head with how Docker is for me - it's easy to use a docker image locally, but it beomces really hard to figure out how to 'release' that docker image into production - it needs to be gotten to the server(s!) some how, and made sure that it's running, with a load balancer in front of it, and configuration. OpenShfit is intended to just wade in and solve all thse problems. It takes Kubernetes and adds access control, routing between services and the ability to build and deploy docker images. It can handle a number of deployment strategies such as rolling (stop an instance, start with new image), or recreating images (all images down, run databse migrations, start all images). Graham noted automation is great, but one step at a time - might not be needed for your org. A really cool looking part of OpenShift is using "builder images" for docker to produce a prod docker image. This is something I've struggled with - it's hard to make a docker image that has all the necessary hooks for debugging in dev that is also buildable for prod. There's a bunch of variants of OpenShift - some paid for, but generally free and open source if you run yourself. Vagrant VMs available to provision VM to try it out.

**Action points:** Provision OpenShift and try it out.

### Michael Neale: CloudBees

Talking about deployment pipelines - e.g. a series of steps, some parallel some sequential needed to take a revision of code through necessary checks, predeployment, deployment and post-deployment steps. Also mentioned an interesting point - deployments can have multiple triggers, not just code pushes - for example, when a docker image that a service is depending on is pushed, that should really trigger a deploy.

Michael talked about the history of Jenkins and it's bad rap due to age and bad UX. He talked about recent changes that have made it easier to declare pipelines for testing and deployment with a "Jenkinsfile" in the root of the project. This, in conjunction wiht a Dockerfile allows really easy builds - dockerfile provides environment, jenkinsfile provides pipeline. There is an [interesting sounding blog post](https://jenkins.io/blog/2016/08/08/docker-pipeline-environments/) on the Jenkins blog covering this. Something I noted down was that having a build process that actually used a project's dockerfile would allow changes to that dockerfile to, to an extent, be continuously tested and integrated.

There is also apparently a new feature on the way called "Organisation folders". This is basically using the OAuth connection Jenkins has with Github or Bitbucket to recognise when a new repo is created in a team, and use that repos jenkinsfile and dockerfile to automatically create a jenkins project and start building it. I thought this was interesting as it was basically the issue that a few devs were having at Rabid the other day - probabems setting up a codeship project properly.

Michael has also been invovled in the Blue Ocean UI rebuild of Jenkins, which I'm very keen for Rabid to try out - it looks amazing, and really clear as to what the steps involved are. Depending on the management invovled, it would be very interesting to try out Jenkins with some docker projects, and also maybe some Android builds which we cannot currently do with Codeship:

**Action points:** read docker + jenkins blog post, try out Jenkins in docker with new UI.

### Kara Hatherly - Atlassian:

Kara talked about trying to migrate Jira from a _really_ interesting architecture into a more services-oriented approach. Apparently, Jira started off as a product that companies would buy, get a .war package for, and then run that themselves in their own Tomcat instance. When Jira moved to more of a SaSS framework, all they did was change it so that a new customer would have a VM provisioned in Atlassian's data center, with their own DB and instance of Jira. Obviously this collection of monoliths caused some issues with deployment and scaling, so they've made the choice to move to a multitenant services structure.

Most of my notes of Kara's talk cover the things to be aware of when trying to migrate a sytem like this:

1. Identity themes - themes represent concerns that be split into services
2. Build backlog
3. Identity techniques/alternatives - for example, can a particular concern be replaced with a SaSS or open source product?
4. Iterate

For the roll out of new features, Atlassian had some trouble due to the configurability of Jira and the way plugins had been integrated. They ended up taking a couple of testing approaches, but one that worked well for them was to run their tests against real user data - including configuration and plugins. Due to their privacy policy, user data was anonomized, but they had a couple of issues where they got client permission to directly use their data as some issues were specific just to that data. Kara mentioned the Github Scientist project as well for running new and old code paths and verifying behaviour - in particular, they took a four step approach:

1. Run the old code path only
2. Run the old code primarily, and run the new code in the background and verify the outputs are the same
3. Run the new code primarily, and run the old code in the background and verify the outputs are the same
4. Run the new code only, old code can be removed.

Kara also mentioned that it is really convenient to have a process in place for getting real user data, anonimized, for running tests against.

### Paul Stack - Hashicorp talking about [Vault](https://www.vaultproject.io/)

Vault is a really exciting project for secret management that has actually considered how it works for services as well as humans.

Paul started off by defining a secret as something that you don't want leaked - could be passwords, certs, API keys, encryption keys. He did this so as to also define sensitive information - customer details, credit card numbers, other personal info. He identified the key challenges for managing these information types are defining how to get values, and temporarily give access to credentials, with the ability to revoke access. He talked about previous generations of secret management - hardcoded in config files, config management (Chef, Puppet, etc), and online DBs such as consul. None of these solutions are quite right, but consul-type things are where a lot of companies are at now for _service authentications_. Consul is plaintext though, takes time to change values and has no ability to revoke access to a secret.

Vaults Goals:

* Single source for secrets
* API & Human access
* "Practical Security"

Vaults Features:

* Different storage backends - PG, in-memory, consul (storing encrypted values only)
* Leasing, renewal, revoke values
* Pluggable client authentication - user/pass, oauth, certificates, etc.

Dynamic Secrets:

Kind of a neat feature Paul talked about where, if Vault has access to systems it supports (Postgres, MySQL, etc), it can manage those services to protect the 'root' credentials. For example, instead of storing and serving database username/password in vault you would store it once, but then each client would get a randomized username/pass that gave them access for 30 minutes, and could be revoked or extended (if lease renwewal is permitted). Vault does this by connecting to whatever system that login is for, and managing the role system - for example, for Postgres, it would connect and `CREATE ROLE` with the randomized value, deleting it when it expires or is revoked. This seems like a neat system, but I didn't really understand how much access Vault would need to accomplish this.

Auditing:

Auditing sounds solid. Secrets are hashed, so if you know the value of a secret you can sha1sum it and search by that term - but the plaintext values won't show in a log. Can log to file, or syslog, or add plugin.

Distribution:

Vault distributed as HA - uses Consul with master/slave to failover to. Vaults are initially sealed - nodes must enter master key to decrypt secrets. Master key can be multiple - e.g. 3 different keys required to unseal, but this makes autoscaling and automation hard. 
