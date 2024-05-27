<!-- action-docs-header source="action.yml" -->
## Action AWS Backend Setup
<!-- action-docs-header source="action.yml" -->
![Demo Status](https://github.com/alonch/actions-aws-backend-setup/actions/workflows/on-push.yml/badge.svg)

<!-- action-docs-description source="action.yml" -->
## Description

Search or Create Terraform backend resources on AWS
<!-- action-docs-description source="action.yml" --> 

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `instance` | <p>Unique identifier for infrastructure</p> | `true` | `my-backend` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->
## Outputs

| name | description |
| --- | --- |
| `s3` | <p>Backend S3 name</p> |
| `dynamodb` | <p>Backend dynamodb Table</p> |
<!-- action-docs-outputs source="action.yml" -->

## Output Environment Variables
| name | description |
| --- | --- |
| `TF_BACKEND_s3` | <p>Backend S3 name</p> |
| `TF_BACKEND_dynamodb` | <p>Backend dynamodb Table</p> |

## Sample Usage
```yml
permissions: 
  id-token: write
jobs:
  apply:
    runs-on: ubuntu-latest
    steps:
      - name: Check out repo
        uses: actions/checkout@v4
      - uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-region: us-east-1
          role-to-assume: ${{ secrets.ROLE_ARN }}
          role-session-name: ${{ github.actor }}
      - uses: alonch/actions-aws-backend-setup@main
        with: 
          instance: demo
      - uses: alonch/actions-aws-website@main
        with: 
          domain: ${{ env.DOMAIN }}
          content-path: public
          action: apply
```