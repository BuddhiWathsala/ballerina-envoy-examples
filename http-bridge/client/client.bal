import ballerina/http;
import ballerina/log;

configurable string CLIENT_PROXY = "http://vk-client-proxy:9911";
final http:Client clientEndpoint = check new (CLIENT_PROXY);

service /GreetingService on new http:Listener(9113) {
    resource function get greeting/[string name]() returns string|error {
            // Sends a `GET` request to the specified endpoint.
        log:printInfo(CLIENT_PROXY);
        string resp = check clientEndpoint->get(string `/HelloService/sayHello/${name}`);
        log:printInfo(resp);
        log:printInfo("Called greeting");
        return string `Hey ${name}`;

    }
}
