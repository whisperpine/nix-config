import type { Plugin } from "@opencode-ai/plugin";

/** An opencode plugin that injects environment variables in shell sessions. */
export const injectEnvPlugin: Plugin = async () => {
  return {
    "shell.env": async (_input, output) => {
      // Use this prompt to test if it works:
      // Run `echo $YUSONG_CUSTOM_OPENCODE_ENV`.
      output.env.YUSONG_CUSTOM_OPENCODE_ENV =
        "If you see this line, the opencode plugin works.";
    },
  };
};
