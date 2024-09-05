exports.handler = async (event) => {
    const response = {
        statusCode: 200,
        body: JSON.stringify('hello dazn lambda'),
    };
    return response;
};
