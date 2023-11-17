class ResponseMixin(object):
    meta_data = dict()
    data = None
    error = None
    status = 200

    def __init__(self):
        self.meta_data = dict()
        self.data = None
        self.error = None
        self.status = 200
        self.json_schema = None
        super().__init__()

    @property
    def response_obj(self):
        resp = dict()
        resp["meta"] = self.meta_data
        resp["status"] = self.status
        resp["error"] = self.error
        resp["response"] = self.data
        return resp
