return {
  "microsoft/vscode-js-debug",
  opt = true,
  lazy = false,
  run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
}
