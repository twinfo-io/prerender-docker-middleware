# Prerender docker middleware

This is a standalone docker component that can be used as a middleware to prerender your website with Prerender.io when you don't have the possibility to use other middlewares (or simply when you prefer to do it this way).

## How-To

1. Assign a secondary domain to your website.

E.g. if your website is `www.example.com` (primary domain), then point `www2.example.com` (secondary domain) to your website too.

> Don't add the secondary domain name as a CNAME for your primary domain, as you will need to re-point your primary domain to this docker component at the end of the setup. Use an A or AAAA record instead. Or use a CNAME that is provided by your hosting provider, but **doesn't match your primary domain**.

2. Edit the `Dockerfile` to match your settings.

Set your secondary domain (`BACKEND_HOST`), primary domain (`SERVER_NAME`) and API key (`PRERENDER_API_KEY`). You may want to use environment variables later, but we suggest you doing it in the file first to avoid environment compatibility issues during your first setup.

3. Setup this docker container to run as a standalone server.

This step highly depends on your infrastructure so it's hard to give you more suggestions here, but a common step is to upload this dockerfile to a component-based cloud provider, such as [Digital Ocean App Platform](https://docs.digitalocean.com/products/app-platform/languages-frameworks/docker/), [Heroku](https://devcenter.heroku.com/categories/deploying-with-docker), [AWS ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/getting-started.html) or [Elastic Beanstalk](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_docker.html). Or use your already existing, Docker-capable kubernetes cluster, as you like.

4. **Point your primary domain to this new component.**

> At this point you're good to use a CNAME too, as this is a brand new component.

5. Test

Send a few request to your primary domain using `curl`, and see the difference how it responds to different user agents.

### Emulate a normal user request

> The user agent could be anything that doesn't look like a bot, we just added something here for clarity.

```bash
curl -A Chrome https://www.example.com
```

### Emulate a bot request

```bash
curl -A Googlebot https://www.example.com
```
