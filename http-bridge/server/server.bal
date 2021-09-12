import ballerina/http;
import ballerina/log;

service /HelloService on new http:Listener(9112) {
    resource function get sayHello/[string name]() returns string {
        log:printInfo("Called say hello");
        return string `Hey ${name}`;
    }
}