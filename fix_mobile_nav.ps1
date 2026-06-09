$mobileMenuButton = @'
<button id="mobile-menu-button" class="inline-flex items-center justify-center p-2 rounded-full hover:bg-surface-container md:hidden" aria-label="Buka menu">
  <span class="material-symbols-outlined text-on-surface-variant">menu</span>
</button>
'@

$mobileNav = @'
<div id="mobile-nav-backdrop" class="hidden md:hidden fixed inset-0 bg-black/40 z-50"></div>
<div id="mobile-nav-panel" class="hidden md:hidden fixed inset-y-0 left-0 w-72 max-w-[320px] bg-surface-container-lowest shadow-[0_0_32px_rgba(0,0,0,0.16)] z-50 overflow-y-auto">
  <div class="flex items-center justify-between px-5 py-5 border-b border-outline-variant/30">
    <div class="flex items-center gap-3">
      <div class="w-9 h-9 bg-[#003466] rounded-lg flex items-center justify-center">
        <span class="material-symbols-outlined text-white text-lg" style="font-variation-settings:'FILL' 1;">balance</span>
      </div>
      <div>
        <h2 class="text-sm font-black text-[#003466] font-manrope">Akses Legal</h2>
        <p class="text-[10px] uppercase tracking-widest text-secondary">Menu</p>
      </div>
    </div>
    <button id="mobile-nav-close" class="p-2 rounded-full hover:bg-surface-container" aria-label="Tutup menu">
      <span class="material-symbols-outlined text-on-surface-variant">close</span>
    </button>
  </div>
  <nav class="px-5 py-4 space-y-2" aria-label="Menu navigasi mobile">
    <a href="overview-dekstop.html" class="flex items-center gap-3 px-4 py-3 text-on-surface-variant hover:bg-surface-container rounded-xl transition-all group">
      <span class="material-symbols-outlined group-hover:text-primary">dashboard</span>
      <span class="text-sm font-manrope">Overview</span>
    </a>
    <a href="konsultasi-dekstop.html" class="flex items-center gap-3 px-4 py-3 text-on-surface-variant hover:bg-surface-container rounded-xl transition-all group">
      <span class="material-symbols-outlined group-hover:text-primary">support_agent</span>
      <span class="text-sm font-manrope">Konsultasi</span>
    </a>
    <a href="permohonansaya-dekstop.html" class="flex items-center gap-3 px-4 py-3 text-[#003466] font-bold rounded-xl nav-active transition-all" aria-current="page">
      <span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1;">assignment</span>
      <span class="text-sm font-manrope">Permohonan Saya</span>
    </a>
    <a href="brankasdokumen-dekstop.html" class="flex items-center gap-3 px-4 py-3 text-on-surface-variant hover:bg-surface-container rounded-xl transition-all group">
      <span class="material-symbols-outlined group-hover:text-primary">folder_open</span>
      <span class="text-sm font-manrope">Dokumen Legal</span>
    </a>
    <a href="billing&harga-dekstop.html" class="flex items-center gap-3 px-4 py-3 text-on-surface-variant hover:bg-surface-container rounded-xl transition-all group">
      <span class="material-symbols-outlined group-hover:text-primary">payments</span>
      <span class="text-sm font-manrope">Billing & Harga</span>
    </a>
    <a href="klaimpelaporanspt-dekstop.html" class="flex items-center gap-3 px-4 py-3 text-on-surface-variant hover:bg-surface-container rounded-xl transition-all group">
      <span class="material-symbols-outlined group-hover:text-primary">receipt_long</span>
      <span class="text-sm font-manrope">Pelaporan Pajak</span>
    </a>
  </nav>
  <div class="px-5 pb-4 space-y-2">
    <div class="px-3 py-3 bg-primary/5 rounded-xl border border-primary/10">
      <p class="text-[10px] font-bold text-primary uppercase tracking-wider mb-2">Layanan Baru</p>
      <a href="konsultasi-dekstop.html" class="flex items-center justify-center gap-2 w-full py-2.5 bg-[#003466] text-white text-sm font-bold rounded-lg hover:bg-primary transition-all active:scale-95">
        <span class="material-symbols-outlined text-sm">add</span>
        Mulai Konsultasi
      </a>
    </div>
    <a href="#" class="flex items-center gap-3 px-4 py-2.5 text-on-surface-variant hover:bg-surface-container rounded-xl transition-all text-sm">
      <span class="material-symbols-outlined text-lg">help_outline</span>
      <span class="font-manrope">Bantuan</span>
    </a>
    <a href="#" class="flex items-center gap-3 px-4 py-2.5 text-error hover:bg-error-container/20 rounded-xl transition-all text-sm">
      <span class="material-symbols-outlined text-lg">logout</span>
      <span class="font-manrope">Keluar</span>
    </a>
  </div>
</div>
'@

$mobileScript = @'
<script>
  const mobileNavButton = document.getElementById("mobile-menu-button");
  const mobileNavBackdrop = document.getElementById("mobile-nav-backdrop");
  const mobileNavPanel = document.getElementById("mobile-nav-panel");
  const mobileNavClose = document.getElementById("mobile-nav-close");

  const openMobileNav = () => {
    mobileNavBackdrop?.classList.remove("hidden");
    mobileNavPanel?.classList.remove("hidden");
  };

  const closeMobileNav = () => {
    mobileNavBackdrop?.classList.add("hidden");
    mobileNavPanel?.classList.add("hidden");
  };

  mobileNavButton?.addEventListener("click", openMobileNav);
  mobileNavClose?.addEventListener("click", closeMobileNav);
  mobileNavBackdrop?.addEventListener("click", closeMobileNav);
</script>
'@

Get-ChildItem *-dekstop.html | ForEach-Object {
    $path = $_.FullName
    $text = Get-Content $path -Raw

    # Cleanup malformed injected text
    $text = $text -replace "`n", ""
    $text = $text -replace "`r", ""

    # Remove all existing mobile nav elements and scripts
    $text = [regex]::Replace($text, '(?s)<button id="mobile-menu-button".*?</button>', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    $text = [regex]::Replace($text, '(?s)<div id="mobile-nav-backdrop".*?</div>\s*<div id="mobile-nav-panel".*?</div>', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    $text = [regex]::Replace($text, '(?s)<script>.*?mobileNavButton.*?</script>\s*', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)

    # Insert mobile menu button into header
    $text = [regex]::Replace($text, '(<header[^>]*aria-label="Header aplikasi"[^>]*>\s*<div class="flex items-center justify-between px-4 md:px-8 h-14 md:h-16">)', "$1`n$mobileMenuButton", [System.Text.RegularExpressions.RegexOptions]::Singleline)

    # Insert mobile nav block after sidebar close
    $text = [regex]::Replace($text, '</aside>', '</aside>' + $mobileNav, [System.Text.RegularExpressions.RegexOptions]::Singleline, 1)

    # Insert mobile script before body close
    $text = [regex]::Replace($text, '</body>', $mobileScript + '</body>', [System.Text.RegularExpressions.RegexOptions]::Singleline, 1)

    Set-Content -Path $path -Value $text
}
Write-Host "Mobile nav cleanup complete."
