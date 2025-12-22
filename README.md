# RB X Manual 프로젝트 안내서

퇴사 후 인수인계를 받을 동료를 위해 RB X Manual Flutter 프로젝트 사용법을 정리했습니다. Flutter와 GitHub을 처음 접하는 사람도 이 문서를 차근차근 따라 하면 프로젝트를 수정하고 배포까지 진행할 수 있습니다.

## 목차
1. [프로젝트 개요](#프로젝트-개요)
2. [사용 기술 및 주요 디렉터리](#사용-기술-및-주요-디렉터리)
3. [개발 환경 준비하기](#개발-환경-준비하기)
4. [프로젝트 실행 방법](#프로젝트-실행-방법)
5. [매뉴얼 콘텐츠 구조 이해하기](#매뉴얼-콘텐츠-구조-이해하기)
   - [ManualSectionContent / ManualContentBlock 개요](#manualsectioncontent--manualcontentblock-개요)
   - [한국어 매뉴얼 수정 절차](#한국어-매뉴얼manual_contentdart-수정-절차)
   - [영어 매뉴얼 수정 절차](#영어-매뉴얼manual_content_endart-수정-절차)
   - [목차(manual_toc.dart) 수정 방법](#목차manual_tocdart-수정-방법)
   - [이미지 에셋 추가](#이미지-에셋-추가)
6. [Git 사용 방법 (처음 사용하는 사람용)](#git-사용-방법-처음-사용하는-사람용)
7. [GitHub Actions 자동 배포 과정](#github-actions-자동-배포-과정)
8. [자주 묻는 질문 및 팁](#자주-묻는-질문-및-팁)
9. [새 언어 추가 가이드](#새-언어-추가-가이드)

---

## 프로젝트 개요
- **프로젝트명:** RB X Manual
- **역할:** RB-Ware 로봇 매뉴얼을 웹/데스크톱에서 열람할 수 있게 하는 Flutter 앱
- **언어 지원:** 한국어, 영어 (동일한 구조와 내용을 유지해야 함)
- **주요 기능:** 목차 기반 네비게이션, 섹션별 상세 매뉴얼, 이미지/주석 지원, Flutter Web 빌드 후 GitHub Pages 자동 배포

## 사용 기술 및 주요 디렉터리
- **프레임워크:** Flutter (stable 채널)
- **언어:** Dart
- **주요 디렉터리 구조:**
  ```text
  lib/
    manual/
      data/
        manual_content.dart        # 한국어 매뉴얼 본문
        manual_content_en.dart     # 영어 매뉴얼 본문
        manual_toc.dart            # 한국어 목차
        manual_toc_en.dart         # 영어 목차
      models/
        manual_content.dart        # 콘텐츠 모델 클래스 정의
      view/
        manual_page.dart           # 메인 화면 및 언어 전환 로직
        widgets/manual_content.dart# 섹션 렌더링 위젯
  assets/rbx-screens/              # 매뉴얼에 사용되는 이미지 모음
  .github/workflows/deploy.yml     # GitHub Actions 자동 배포 스크립트
  ```

## 개발 환경 준비하기
1. **Flutter 설치**
   - https://docs.flutter.dev/get-started/install 에 접속하여 OS에 맞게 Flutter SDK 설치
   - 설치 후 터미널(명령 프롬프트)에서 `flutter doctor` 실행 → 문제가 있다면 안내에 따라 해결

2. **필수 도구 설치**
   - **Git**: https://git-scm.com/downloads 에서 내려받아 설치 (설치 중 “Git Bash 사용” 옵션 선택 권장)
   - **VS Code** 또는 IntelliJ / Android Studio 중 하나 설치 (코드 편집기)
   - **Chrome 브라우저** (웹 실행 시 필요)

3. **환경 변수 설정 (Windows 기준)**
   - Flutter 설치 경로의 `flutter/bin`을 시스템 PATH에 추가
   - Git 설치 경로의 `bin` 폴더도 PATH에 자동 등록되며, 등록되지 않으면 직접 추가

## 프로젝트 실행 방법
1. **프로젝트 클론 받기** (GitHub 계정이 없다면 먼저 회원가입)
   ```bash
   git clone https://github.com/rb-ware/rbx-manual.git
   cd rbx-manual
   ```

2. **Flutter 패키지 설치**
   ```bash
   flutter pub get
   ```

3. **웹으로 실행해 보기**
   ```bash
   flutter run -d chrome
   ```
   - 처음 실행 시 필요한 도구를 자동으로 설치하므로 시간이 다소 걸릴 수 있습니다.
   - `flutter run`이 완료되면 브라우저에서 앱이 열립니다.

4. **웹 릴리스 빌드 (선택)**
   ```bash
   flutter build web --release --base-href /rbx-manual/
   ```
   - GitHub Pages 배포 시 사용되는 명령어입니다. 로컬에서 결과물(`build/web`)을 확인할 때 활용하세요.

## 매뉴얼 콘텐츠 구조 이해하기

### ManualSectionContent / ManualContentBlock 개요
`lib/manual/models/manual_content.dart` 파일에는 매뉴얼을 구성하는 기본 데이터 모델이 정의되어 있습니다.

| 클래스 | 설명 |
| --- | --- |
| `ManualSectionContent` | 하나의 목차 항목(entryId)에 대응하는 본문(여러 블록)을 묶는 컨테이너 |
| `ManualContentBlock` | 실제로 화면에 출력되는 블록 단위 (제목, 문단, 리스트, 이미지 등) |
| `ManualContentBlock.heading(String text)` | 섹션/하위 섹션 제목 |
| `ManualContentBlock.paragraph(String text)` | 일반 문단 텍스트 |
| `ManualContentBlock.bullets(List<String> items)` | 글머리표 리스트 |
| `ManualContentBlock.image(String assetPath, {String? caption, double? maxWidth})` | 단순 이미지 |
| `ManualContentBlock.annotatedImage(String assetPath, {List<ManualImageMarker> markers})` | 이미지에 주석(마커) 표시 |
| `ManualContentBlock.note(String text)` | 참고/주의 문구 박스 |
| `ManualImageMarker` | 주석 이미지에 위치/설명 텍스트를 지정하는 객체 |

> **팁:** 한국어/영어 두 파일은 동일한 구조를 유지해야 합니다. 한국어에서 섹션을 추가하거나 순서를 바꿀 경우 영어 파일도 반드시 동일하게 수정하세요.

### 한국어 매뉴얼(`manual_content.dart`) 수정 절차
1. `lib/manual/data/manual_content.dart` 열기
2. 원하는 `entryId`를 가진 `ManualSectionContent` 찾기
3. `blocks: []` 내부에 필요한 `ManualContentBlock`를 추가 또는 수정
4. 필요 시 이미지 경로 또는 캡션 업데이트 (이미지는 `assets/rbx-screens` 사용)

#### 새 섹션 추가 예시
```dart
const manualSectionContentsKo = <ManualSectionContent>[
  ManualSectionContent(
    entryId: '5-6-welding-condition',
    blocks: [
      ManualContentBlock.heading('5-6. 용접 조건 일괄 수정'),
      ManualContentBlock.paragraph('해당 기능 설명...'),
      ManualContentBlock.image(
        'assets/rbx-screens/batch-weld-mod.png',
        maxWidth: 600,
        caption: 'Batch Weld Mod 화면',
      ),
    ],
  ),
];
```

### 영어 매뉴얼(`manual_content_en.dart`) 수정 절차
- 한국어 버전과 동일한 구조로 번역된 내용 작성
- 영어 표현이 자연스러운지 확인하고, 내용이 누락되거나 순서가 다른 부분이 없는지 검토

```dart
const manualSectionContentsEn = <ManualSectionContent>[
  ManualSectionContent(
    entryId: '5-6-welding-condition',
    blocks: [
      ManualContentBlock.heading('5-6. Batch Weld Condition'),
      ManualContentBlock.paragraph(
        'Explain the feature in English...'
      ),
    ],
  ),
];
```

### 목차(`manual_toc.dart`) 수정 방법
- `ManualEntry`는 `title`과 `id`를 가지며, `children`으로 하위 목차를 가질 수 있습니다.
- 한국어(`manual_toc.dart`)와 영어(`manual_toc_en.dart`) 파일에 동일한 목차 구조를 유지해야 합니다.

```dart
const manualToc = <ManualEntry>[
  ManualEntry(
    id: '5-6-welding-condition',
    title: '5-6. 용접 조건 일괄 수정',
  ),
];
```

### 이미지 에셋 추가
1. `assets/rbx-screens/` 폴더에 새 이미지를 저장
2. `pubspec.yaml`의 `flutter.assets` 섹션에 해당 폴더가 포함되어 있는지 확인 (이미 전체 폴더가 추가되어 있음)
3. 매뉴얼 본문에서 `ManualContentBlock.image('assets/rbx-screens/파일명.png')` 형태로 사용
4. 큰 이미지는 `maxWidth` 옵션으로 폭을 제한하여 화면에 맞게 표시

---

## Git 사용 방법 (처음 사용하는 사람용)

### 1. Git 최초 설정
```bash
git config --global user.name "홍길동"
git config --global user.email "user@example.com"
```
- 위 명령은 한 번만 실행하면 됩니다. 이름과 이메일은 본인 것으로 입력하세요.

### 2. 저장소 클론
```bash
git clone https://github.com/rb-ware/rbx-manual.git
cd rbx-manual
```
- GitHub에 로그인한 뒤 위 명령을 복사해 Git Bash 또는 터미널에서 수행합니다.

### 3. 변경 전 최신 상태로 맞추기
```bash
git pull origin main
```
- 다른 사람이 먼저 수정했을 수 있으므로 작업 전 항상 최신 상태로 맞춰 주세요.

### 4. 작업 후 변경 내용 확인
```bash
git status          # 수정한 파일 목록 확인
git diff            # 수정된 내용 상세 확인
```

### 5. 변경 내용 저장(커밋)과 업로드(푸시)
```bash
git add lib/manual/data/manual_content.dart
git add lib/manual/data/manual_content_en.dart
git add README.md

git commit -m "Update welding condition manual"
git push origin main
```
- `git add` 는 수정한 파일을 커밋에 포함시키는 단계입니다.
- `git commit` 메시지는 영어 한 줄로 작성하는 것을 권장합니다.
- `git push` 후 GitHub에 로그인 정보 입력(또는 Personal Access Token 사용) 안내가 나오면 안내에 따라 입력하세요.

### 6. 푸시 실패 시 해결
- **메시지:** `rejected` 또는 `fetch first` → 다른 사람이 먼저 올렸으므로 `git pull origin main` 실행 후 충돌 해결 → 다시 5단계 수행
- **충돌 발생:** 편집기에서 충돌 표시(`<<<<`, `====`, `>>>>`)를 찾아 직접 내용을 조정 → 저장 → `git add` → `git commit --amend` 또는 새 `git commit` → `git push`

### 7. 새로운 파일 추가/삭제
- 새 이미지를 추가했다면 `git add assets/rbx-screens/새파일.png`
- 삭제한 파일은 `git add -u` 로 추적하거나 `git rm 파일명`

---

## GitHub Actions 자동 배포 과정
저장소의 `.github/workflows/deploy.yml` 파일이 GitHub Actions를 설정합니다.

1. **동작 시점:** `main` 브랜치에 `git push`가 실행될 때마다 자동으로 시작
2. **작업 단계:**
   1. 저장소 체크아웃
   2. Flutter 설치 (stable 채널)
   3. `flutter pub get` 실행
   4. `flutter build web --release --base-href /rbx-manual/` 명령으로 웹 빌드
   5. `gh-pages` 브랜치에 결과물(`build/web`) 배포
3. **배포 위치:** GitHub Pages → `https://rb-ware.github.io/rbx-manual/`
4. **배포 확인 방법:**
   - GitHub 저장소 → **Actions** 탭 → 최신 워크플로우 실행 상태 확인
   - 성공(Green) 상태인지 확인하고, 실패 시 로그를 열어 오류 메시지 확인
5. **주의 사항:**
   - Flutter 버전이 크게 변경되면 빌드가 실패할 수 있으므로 로컬에서 먼저 `flutter build web`을 시도해 보는 것이 좋습니다.
   - `publish_branch: gh-pages` 설정 때문에 수동으로 이 브랜치를 수정하지 않는 것이 좋습니다.

---

## 자주 묻는 질문 및 팁
- **Q. 한국어만 수정하면 되나요?** → 아니요, 항상 영어 파일도 함께 수정해야 합니다.
- **Q. 이미지가 화면보다 너무 크게 나와요.** → `ManualContentBlock.image`에서 `maxWidth` 값을 500~700 사이로 조절합니다.
- **Q. 로컬에서 웹 빌드가 너무 오래 걸립니다.** → 최초 빌드만 오래 걸리고, 이후에는 캐시 덕분에 빨라집니다.
- **Q. GitHub 로그인 정보가 기억나지 않아요.** → GitHub → Settings → Developer settings → Personal access tokens에서 새 토큰을 발급받아 사용하세요. (권한: `repo`)
- **Q. Flutter doctor에 Android 관련 경고가 나와요.** → 웹 빌드만 사용한다면 무시해도 됩니다.

---

## 추가 자료
- Flutter 공식 문서: https://docs.flutter.dev/
- Git 튜토리얼(한국어): https://rogerdudler.github.io/git-guide/index.ko.html
- GitHub Pages 소개: https://docs.github.com/ko/pages/getting-started-with-github-pages/about-github-pages

## 새 언어 추가 가이드
터키어(`tr`), 스페인어(`es`), 독일어(`de`), 네덜란드어(`nl`) 등 새로운 언어를 추가하려면 아래 절차를 따르면 됩니다.

1. **언어 코드 및 폴더 준비**
   - ISO 639-1 두 글자 코드를 사용하세요 (`tr`, `es`, `de`, `nl` 등).
   - 문자열/이미지 자원은 기존 폴더 구조(`assets/rbx-screens/`)를 그대로 사용하며, 번역이 필요한 경우 별도의 하위 폴더를 만들어도 됩니다.

2. **매뉴얼 본문/목차 파일 복제 및 번역**
   1. `lib/manual/data/manual_content_en.dart`를 복사해 `manual_content_tr.dart`처럼 새 파일을 만들고, 내용을 해당 언어로 번역합니다.
   2. `lib/manual/data/manual_toc_en.dart`를 복사해 `manual_toc_tr.dart`처럼 새 파일을 만들고, 목차 제목을 번역합니다.
   3. 파일 내 상수 이름도 언어에 맞춰 바꾸세요.
      ```dart
      // manual_content_tr.dart
      const manualSectionContentsTr = <ManualSectionContent>[
        // ... 터키어 번역된 섹션 ...
      ];
      ```

3. **ManualPage에 새 언어 등록** (`lib/manual/view/manual_page.dart`)
   1. 새로 만든 데이터 파일을 import 합니다.
      ```dart
      import '../data/manual_content_tr.dart' as tr;
      import '../data/manual_toc_tr.dart' as tr_toc;
      ```
   2. `_lang`의 초기값이 한국어로 고정되어 있다면 유지하되, 필요한 경우 기본 언어를 조정합니다.
   3. `_tocForLang`과 `_contentsForLang` 함수에 새 언어 분기를 추가합니다.
      ```dart
      List<ManualEntry> _tocForLang(String lang) {
        switch (lang) {
          case 'tr':
            return tr_toc.manualTocTr;
          case 'en':
            return en_toc.manualTocEn;
          default:
            return ko_toc.manualToc;
        }
      }

      List<ManualSectionContent> _contentsForLang(String lang) {
        switch (lang) {
          case 'tr':
            return tr.manualSectionContentsTr;
          case 'en':
            return en.manualSectionContentsEn;
          default:
            return ko.manualSectionContentsKo;
        }
      }
      ```
   4. `_LanguageDropdown`에서 언어 선택지를 확장합니다.
      ```dart
      const trLabel = 'Türkçe';
      // DropdownButton items에 'tr' 항목 추가
      DropdownMenuItem(
        value: 'tr',
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(trLabel, maxLines: 1),
        ),
      ),
      ```
   5. `emptyContentText` 등 언어별 안내 문구도 새 언어에 맞게 분기 처리합니다.

4. **언어 라벨/문자 렌더링 확인**
   - 특수 문자(예: ñ, ü, ğ)가 포함되므로 UI에서 정상적으로 표시되는지 확인합니다.
   - 필요한 경우 `pubspec.yaml`에 폰트 패키지를 추가하거나, 기본 폰트가 해당 문자를 지원하는지 검토합니다.

5. **테스트 및 배포**
   - `flutter run -d chrome`으로 로컬에서 각 언어가 정상적으로 전환되는지 확인합니다.
   - 문제 없으면 `git add`, `git commit`, `git push origin main` 순서로 푸시하여 GitHub Actions 자동 배포가 실행되도록 합니다.

> **팁:** 언어가 늘어날수록 `switch` 대신 `Map<String, LanguageBundle>` 형태로 리팩터링하면 관리가 쉬워집니다. 예: `supportedLanguages['tr']!.content`처럼 접근하면 파일 추가 시 실수를 줄일 수 있습니다.
