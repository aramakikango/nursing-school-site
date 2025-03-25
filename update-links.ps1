# プロジェクトのルートディレクトリを取得
$PROJECT_DIR = (Get-Location).Path
$INDEX_FILE = "$PROJECT_DIR\index.html"

# デバッグ用メッセージ表示
Write-Host "=== デバッグ情報 ===" -ForegroundColor Yellow
Write-Host "プロジェクトディレクトリ: $PROJECT_DIR"
Write-Host "インデックスファイルパス: $INDEX_FILE"

# index.html の内容を取得
try {
    $INDEX_CONTENT = Get-Content -Path $INDEX_FILE -Raw -Encoding utf8
    if (-not $INDEX_CONTENT) { 
        Write-Host "❌ エラー: index.html が見つかりません。" -ForegroundColor Red
        exit 
    }
}
catch {
    Write-Host "❌ エラー: index.html の読み込みに失敗しました。" -ForegroundColor Red
    exit
}

# 確認用に内容を表示
Write-Host "=== index.html の内容を表示 (部分的) ==="
Write-Host ($INDEX_CONTENT.Substring(0, 500) + "...")
Write-Host "============================================="

# index.html の書き込みテスト
try {
    [System.IO.File]::WriteAllText($INDEX_FILE, $INDEX_CONTENT, [System.Text.Encoding]::UTF8)
    Write-Host "=== ファイルの読み込みと書き込みテストが成功しました。 ===" -ForegroundColor Green
}
catch {
    Write-Host "❌ エラー: index.html の書き込みに失敗しました。" -ForegroundColor Red
    exit
}

Write-Host "=== 更新完了 ===" -ForegroundColor Green
