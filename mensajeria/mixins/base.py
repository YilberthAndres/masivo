from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST


class Error(object):
    def __init__(self) -> None:
        self.errors: any = None
        self.status: int = 200
        self.valid: bool = False


class Response(object):
    def __init__(self) -> None:
        self.status: int = 200
        self.data: any = None
        self.state: bool = False


class ResponseMixin(object):
    meta_data = dict()
    data = dict()
    error = dict()

    def __init__(self):
        self.meta_data = dict()
        self.data = dict()
        self.error = dict()
        self.json_schema = None
        super().__init__()

    @property
    def response_obj(self):
        resp = dict()
        resp["meta"] = self.meta_data
        if self.error:
            if "valid" not in self.error or "status" not in self.error:
                self.error["valid"] = False
                self.error["status"] = HTTP_400_BAD_REQUEST
            resp["error"] = self.error
        else:
            if "valid" not in self.data or "status" not in self.data:
                self.data["valid"] = True
                self.data["status"] = HTTP_200_OK
            resp["response"] = self.data
        return resp
