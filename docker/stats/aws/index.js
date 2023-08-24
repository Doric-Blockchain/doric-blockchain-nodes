// Use this code snippet in your app.
// If you need more information about configurations or implementing the sample code, visit the AWS docs:
// https://docs.aws.amazon.com/sdk-for-javascript/v3/developer-guide/getting-started.html

const {
  SecretsManagerClient,
  GetSecretValueCommand,
} = require ('@aws-sdk/client-secrets-manager');

const getAwsSecretString = async (secret_name) => {
    const client = new SecretsManagerClient({
        region: process.env.AWS_REGION,
    });

    let response;

    try {
        response = await client.send(
            new GetSecretValueCommand({
                SecretId: secret_name,
                VersionStage: 'AWSCURRENT', 
            })
        );
    } catch (error) {
        throw error;
    }

    const secret = response.SecretString;

    return secret;
}

module.exports = getAwsSecretString;
