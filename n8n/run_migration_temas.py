import json, sys, urllib.request, urllib.error
sys.path.insert(0, "/opt/muse/skills/custom-connector-setup/bin")
from dynamic_credentials import add_surrogate_to_request

class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, *args):
        raise RuntimeError("redirect refused")

sql_path = sys.argv[1]
with open(sql_path, encoding="utf-8") as f:
    sql = f.read()
url = "https://api.supabase.com/v1/projects/dwranvdgnznmkwnulbjr/database/migrations"
data = json.dumps({"name": "marcella_temas_v1", "query": sql}).encode("utf-8")
request = urllib.request.Request(url, data=data, method="POST")
request.add_header("Content-Type", "application/json")
add_surrogate_to_request(request, "custom.supabase-management", allowed_hosts=["api.supabase.com"])
try:
    with urllib.request.build_opener(NoRedirect()).open(request, timeout=90) as response:
        print(response.status)
        print(response.read().decode()[:4000])
except urllib.error.HTTPError as e:
    print(f"HTTP {e.code}")
    print(e.read().decode()[:4000])
except Exception as e:
    print(f"ERROR {type(e).__name__}: {e}")
