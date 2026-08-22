#!/usr/bin/env bash
# Claude Code 플러그인 5종 설치 스크립트
#
# 로컬 터미널에서 실행하세요. 1~4번을 자동으로 처리하고,
# 5번(Task Observer)은 웹 업로드가 필요하므로 안내만 출력합니다.
#
# 사용법:  bash install-plugins.sh

set -uo pipefail

step() { printf '\n\033[1m[%s] %s\033[0m\n' "$1" "$2"; }
ok()   { printf '  \033[32m*\033[0m %s\n' "$1"; }
warn() { printf '  \033[33m!\033[0m %s\n' "$1"; }

# ---------------------------------------------------------------- 1. OmniRoute
# 토큰이 떨어지면 다른 모델로 자동 전환해주는 로컬 게이트웨이.
# localhost:20128 에 중계 서버를 띄우므로 실제 사용하는 PC에서만 의미가 있습니다.
step 1 "OmniRoute"
if ! command -v npm >/dev/null 2>&1; then
  warn "npm 을 찾을 수 없습니다. nodejs.org 에서 LTS 를 설치한 뒤 터미널을 껐다 켜고 다시 실행하세요."
else
  npm install --global omniroute \
    && ok "설치 완료 - 앞으로는 'claude' 대신 'omniroute launch' 로 실행하세요."
  warn "대시보드 확인: http://localhost:20128 (터미널을 닫으면 서버도 함께 종료됩니다)"
fi

# ---------------------------------------------------------------- 2. claude-mem
# 세션이 끝나도 작업 맥락을 기억하고 다음 대화에 자동 주입합니다.
step 2 "claude-mem"
claude plugin marketplace add thedotmack/claude-mem \
  && claude plugin install claude-mem@thedotmack \
  && ok "설치 완료 - Claude Code 를 껐다 켜야 적용됩니다."
warn "전역 npm 설치 방식은 제작자가 문서에서 말린 방식입니다. 위 명령으로만 설치하세요."

# ---------------------------------------------------- 3~4. 앤트로픽 공식 플러그인
# 공식 마켓플레이스는 보통 자동 등록되어 있지만, 없을 때를 대비해 명시적으로 추가합니다.
claude plugin marketplace add anthropics/claude-plugins-official 2>/dev/null || true

step 3 "Frontend Design"
claude plugin install frontend-design@claude-plugins-official && ok "설치 완료"

step 4 "Playwright"
claude plugin install playwright@claude-plugins-official && ok "설치 완료"

# ------------------------------------------------------------ 5. Task Observer
# 이것만 플러그인이 아니라 '스킬'이라 CLI 로 설치할 수 없습니다.
step 5 "Task Observer (수동 업로드 필요)"
cat <<'MSG'
  이 단계는 브라우저에서 직접 해주셔야 합니다.

    1) 설정 -> 기능 -> '코드 실행' 을 켭니다 (꺼져 있으면 스킬이 보이지 않습니다)
    2) claude.ai/customize/skills 로 이동
    3) + 버튼을 누르고 task-observer/task-observer-skill.zip 을 그대로 업로드
       (압축을 풀지 마세요 - SKILL.md 와 references 폴더가 함께 있어야 동작합니다)

  업로드하면 웹/데스크탑/모바일 전부에서, 무료 요금제에서도 사용할 수 있습니다.
MSG

step "완료" "설치된 플러그인 목록"
claude plugin list
