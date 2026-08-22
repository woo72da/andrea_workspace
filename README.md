# Claude Code 플러그인 5종 설치

가이드의 5개 도구를 설치하기 위한 스크립트와 파일입니다.

## 어디서 쓸 수 있나

| 도구 | Claude Code (터미널) | 웹 / 데스크탑 앱 | 설치 방식 |
| --- | --- | --- | --- |
| 1. OmniRoute | 됨 | 안 됨 | npm 전역 설치 |
| 2. claude-mem | 됨 | 안 됨 | 플러그인 (서드파티 마켓) |
| 3. Frontend Design | 됨 | 안 됨 | 플러그인 (공식 마켓) |
| 4. Playwright | 됨 | 안 됨 | 플러그인 (공식 마켓) |
| 5. Task Observer | 됨 | 됨 | 스킬 (zip 업로드) |

1~4번은 Claude Code에 붙는 것이라 웹/앱에는 설치할 자리가 없습니다.
5번만 스킬이라 어디서나 쓸 수 있고 무료 요금제에서도 동작합니다.

## 사용법

```bash
bash install-plugins.sh
```

1~4번이 자동으로 설치되고, 5번은 화면에 업로드 안내가 출력됩니다.

OmniRoute(1번)에만 Node.js가 필요합니다. nodejs.org에서 LTS를 설치한 뒤
**터미널을 껐다가 다시 켜야** 인식됩니다.

## 5번 Task Observer 업로드

`task-observer/task-observer-skill.zip` 을 **압축을 풀지 말고 그대로** 올리세요.

1. 설정 → 기능 → **코드 실행** 켜기 (꺼져 있으면 스킬이 보이지 않습니다)
2. [claude.ai/customize/skills](https://claude.ai/customize/skills) 접속
3. **+** 버튼 → zip 파일 업로드

`SKILL.md` 하나만 올리면 반쪽으로 동작합니다. `references` 폴더가 함께 있어야 합니다.

### zip 구성

제작자의 공식 릴리스 워크플로우(`.github/workflows/release-bundle.yml`)와 동일한 구조로,
원본 저장소 커밋 `281f134`(2026-07-17, v2.0.0)에서 만들었습니다.

```
task-observer/
├── SKILL.md
├── LICENSE.txt
└── references/
    ├── skill-authoring.md
    ├── weekly-review.md
    └── environments.md
```

## 설치 후 확인

Claude Code에서 `/plugin` 을 치면 설치 목록이 나옵니다.
claude-mem은 Claude Code를 껐다 켜야 적용됩니다.

## 출처

| 도구 | 제작자 | 저장소 | 라이선스 |
| --- | --- | --- | --- |
| OmniRoute | diegosouzapw | [diegosouzapw/OmniRoute](https://github.com/diegosouzapw/OmniRoute) | MIT |
| claude-mem | thedotmack | [thedotmack/claude-mem](https://github.com/thedotmack/claude-mem) | Apache-2.0 |
| Frontend Design | Anthropic (공식) | [claude.com/plugins/frontend-design](https://claude.com/plugins/frontend-design) | — |
| Playwright | Microsoft | [claude.com/plugins/playwright](https://claude.com/plugins/playwright) | — |
| Task Observer | Eoghan Henn (rebelytics.com) | [rebelytics/one-skill-to-rule-them-all](https://github.com/rebelytics/one-skill-to-rule-them-all) | CC BY 4.0 |

동봉한 Task Observer zip은 원본 저장소 파일을 수정 없이 그대로 담았으며,
CC BY 4.0 라이선스 전문(`LICENSE.txt`)이 함께 포함되어 있습니다.
