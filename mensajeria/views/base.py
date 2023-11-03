import dotenv, os, requests

dotenv.load_dotenv()

API_KEY_ENV = os.getenv("API_KEY")
API_VERSION_WHATSAPP_ENV = os.getenv("API_VERSION_WHATSAPP")


def api_connect(id_whatsap, path: str, payload={}, method="GET"):
    url = (
        "https://graph.facebook.com/"
        + API_VERSION_WHATSAPP_ENV
        + "/"
        + id_whatsap
        + path
    )

    headers = {
        "Authorization": f"Bearer {API_KEY_ENV}",
        "Content-Type": "application/json",
    }

    if method == "GET":
        return requests.get(url, headers=headers)

    return requests.post(url, headers=headers, json=payload)
