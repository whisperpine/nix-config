import { Plugin } from "@opencode/plugin";

/** An opencode plugin that injects environment variables in shell sessions. */
export default Plugin.define({
  id: "yusong.inject-env",
  async setup(ctx): Promise<void> {
    await ctx.shell.hook("create.before", (event) => {
      // Use this prompt to test if it works:
      // Run `echo $YUSONG_CUSTOM_OPENCODE_ENV`.
      event.env.YUSONG_CUSTOM_OPENCODE_ENV =
        "If you see this line, the opencode plugin works.";
    });
  },
});
