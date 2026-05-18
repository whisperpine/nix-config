import type { Plugin } from "@opencode-ai/plugin";

export const injectEnvPlugin: Plugin = async () => {
  return {
    "shell.env": async (_input, output) => {
      output.env.YUSONG_CUSTOM_OPENCODE_ENV =
        "If you see this line, the opencode plugin works.";
    },
  };
};
