## Rapid Prototyping on AWS Lambda using Ruby Sinatra

This project is a fork of https://github.com/aws-samples/serverless-sinatra-sample
enhanced to support rapid prototyping of REST APIs, simple web applications, and
building webhook workflows using the Ruby Sintra framework deployed on AWS Lambda.

## Get Started

**Prerequisites**: Ruby 2.5, AWS CLI

- Build your prototype: the application code is stored in [app/](app) and test code in [spec/](spec).

- Deploy your application: copy [env.sample](env.sample) to `.env` and update as necessary, or set these environment variables during execution. On completion it spits out the URL of your application.

```
export AWS_DEFAULT_REGION=us-east-1
export AWS_PROFILE=...
rake deploy
```
