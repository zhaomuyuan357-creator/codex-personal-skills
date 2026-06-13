# Session Closeout Examples

These are paste-ready example prompts for triggering the `session-closeout` skill in different styles.

## Short Triggers

```text
Do a session closeout.
```

```text
Wrap up this project for today.
```

```text
End-of-day closeout for this repo.
```

## Handoff-Focused Triggers

```text
Update the handoff, sync project memory, and give me a resume prompt for the next chat.
```

```text
Prepare this project so a new conversation can continue smoothly tomorrow.
```

```text
Summarize today's progress, update the project memory, and tell me how to resume in a fresh thread.
```

## Git-Aware Triggers

```text
Check whether today's work should be committed and pushed, then do a proper session closeout.
```

```text
If this is a good checkpoint, commit and push it, update the handoff notes, and give me a resume prompt.
```

```text
Do a closeout pass: review git status, decide whether to commit/push, then sync the project memory.
```

## Long-Form Triggers

```text
Do a session closeout: inspect the repo state, decide whether today's changes are ready for commit and push, update the progress and handoff memory, update long-term instructions only if they truly need it, and give me a paste-ready prompt for the next conversation.
```

```text
Help me end today's work cleanly: summarize what was finished, what is still in progress, what is blocked, whether code should be committed and pushed, what memory docs should be updated, and how a new chat should resume from here.
```

## Personal Style Variants

```text
帮我做一次收尾：判断是否该提交并推送，更新项目记忆和交接信息，必要时同步长期说明文档，并给我一个下次新对话直接续上的提示词。
```

```text
收个尾：看看现在该不该 commit / push，顺手把 handoff 和 progress 更新掉，必要时同步规则文档，最后给我一个新对话续接口令。
```

```text
结束今天这轮：整理当前进展、阻塞和下一步，更新项目 memory，并告诉我明天新开对话怎么接上。
```

## What Good Output Should Include

A good closeout result should usually include:

- whether code was committed
- whether code was pushed
- which memory or handoff files were updated
- whether any long-term instruction files were updated
- a concise current-status summary
- a paste-ready resume prompt for the next chat
