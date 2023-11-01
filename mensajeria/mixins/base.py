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
    data: Response = Response()
    error: Error = Error()

    def __init__(self):
        self.meta_data = dict()
        self.data: Response = Response()
        self.error: Error = Error()
        self.json_schema = None
        super().__init__()

    @property
    def response_obj(self):
        resp = dict()
        resp["meta"] = self.meta_data
        if self.error:
            resp["error"] = self.error
        else:
            resp["data"] = self.data
        return resp
