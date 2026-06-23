pm.test("Status code is 204", function () {
    pm.response.to.have.status(204);
});

pm.test("Status code is 500", function () {
    pm.response.to.have.status(500);
});

pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

pm.test("Body matches string", function () {
    const json = pm.response.json();
    pm.expect(json.author_name).to.eql("Калмык");
});

const jsonData = pm.response.json();
pm.collectionVariables.set('review_id', jsonData.review_id); 
// Для post-запроса, значение созданной переменной review_id 
// будет использоваться в дальнейших запросов get, patch, и delete