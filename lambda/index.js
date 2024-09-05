exports.handler = async (event) => {
    const response = {
        statusCode: 200,
        body: JSON.stringify('hello room lambda'),
    };
    return response;
};
