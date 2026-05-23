# VPN-Checker
Questo script serve a controllare le VPN attive nel PC di un utente. Ho implementato queste funzionalità:
- Se nel nome dell'interfaccia c'è "VPN" la flagga in rosso
- Volendo si possono vedere automaticamente le VPN chiuse da poco (System > 4207)

Non è uno script estremamente complesso, l'ho fatto per divertirmi ;)

# Comando per eseguire lo script
CMD (admin):
```
powershell Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass && powershell Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/sandydll-bs/VPN-Checker/main/VPNChecker.ps1)
