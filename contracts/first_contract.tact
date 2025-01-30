import "@stdlib/deploy";

message Deploy {
    queriId: Int as uint64;
}

message DeployOk {
    queriId: Int as uint64;
}

trait Deployable {
    receive(deploy: Deploy) {
        self.notify(DeployOk{queriId: deploy.queriId}.toCell());
    }
}

contract FirstContract with Deployable {

    counter: Int as uint32;

    init() {
        self.counter = 0;
    }

    receive("increment"){
        self.counter = self.counter + 1;
    }

    get fun counter(): Int {
        return self.counter;
    }

}
