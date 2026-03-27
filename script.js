const apps_browsers = [
  
  { id: "firefox",     name: "Firefox",         logo: "name/firefox" },
  { id: "chrome",      name: "Chrome",          logo: "name/google%20chrome" },
  { id: "brave",       name: "Brave",           logo: "name/brave" },
  { id: "opera",       name: "Opera",           logo: "name/opera" },

];

const apps_dev = [

  { id: "vscode",      name: "VS Code",         logo: "name/vs%20code" },
  { id: "jetbrains",   name: "JetBrains",       logo: "name/jetBrains%20toolbox" },
  { id: "git",         name: "Git",             logo: "name/git" },
  { id: "nodejs",      name: "Node.js",         logo: "name/node%20js" },
  { id: "python",      name: "Python 3",        logo: "name/python%203" },
  { id: "docker",      name: "Docker",          logo: "name/docker" },
  { id: "neovim",      name: "Neovim",          logo: "name/neovim" },
  { id: "go",          name: "Go",              logo: "name/go" },
  { id: "rust",        name: "Rust",            logo: "name/rust" },
  { id: "java",        name: "Java JDK",        logo: "java.com" },
  { id: "php",         name: "PHP",             logo: "name/php" },
  { id: "postgresql",  name: "PostgreSQL",      logo: "name/postgresql" },
  { id: "mysql",       name: "MySQL",           logo: "name/mysql" },
  { id: "tmux",        name: "Tmux",            logo: "name/tmux" },
  { id: "zsh",         name: "Zsh",             logo: "name/zsh" },

];

const apps_productivity = [

  { id: "libreoffice", name: "LibreOffice",     logo: "name/LibreOffice" },
  { id: "onlyoffice",  name: "OnlyOffice",      logo: "name/onlyOffice" },
  { id: "okular",      name: "Okular",          logo: "name/okular" },
  { id: "obsidian",    name: "Obsidian",        logo: "name/obsidian" },

];

const apps_multimedia = [

  { id: "vlc",         name: "VLC",             logo: "name/vlc" },
  { id: "gimp",        name: "GIMP",            logo: "name/gimp" },
  { id: "obsstudio",   name: "OBS Studio",      logo: "obsproject.com" },
  { id: "kdenlive",    name: "Kdenlive",        logo: "kdenlive.org" },
  { id: "audacity",    name: "Audacity",        logo: "audacityteam.org" },
  { id: "inkscape",    name: "Inkscape",        logo: "name/inkscape" },
  { id: "blender",     name: "Blender",         logo: "name/blender" },
  { id: "krita",       name: "Krita",           logo: "name/krita" },
  { id: "handbrake",   name: "HandBrake",       logo: "handbrake.fr" },
  { id: "spotify",     name: "Spotify",         logo: "name/spotify" },

];

const apps_security = [

  { id: "clamav",      name: "ClamAV",          logo: "clamav.net" },
  { id: "ufw",         name: "UFW",             logo: "name/ubuntu" },
  { id: "wireshark",   name: "Wireshark",       logo: "wireshark.org" },

];

const apps_communication = [
    
  { id: "discord",     name: "Discord",         logo: "name/discord" },
  { id: "telegram",    name: "Telegram",        logo: "name/telegram" },
  { id: "zoom",        name: "Zoom",            logo: "zoom.us" },
  { id: "thunderbird", name: "ThunderBird",     logo: "thunderbird.net" },
  { id: "signal",      name: "Signal",          logo: "name/signal" },
];


function renderApps(apps, sectionId) {
  apps.forEach(app => {
    document.getElementById(sectionId).innerHTML += `
    <div class="app-card col-md-2">
        <div class="custom-control custom-switch">
            <input type="checkbox" class="custom-control-input" id="${app.id}" value="${app.id}" onchange="switch_clicked(this)">
                <label class="custom-control-label" for="${app.id}">
                </label>
        </div>
        <span class="text-white ml-3">${app.name}</span>
        <img src="./img/${app.id}.svg" class="img-fluid" style="max-width: 20px;" alt="${app.name} logo">
    </div>
    `;
  });
}

renderApps(apps_browsers,      "browsers-section");
renderApps(apps_dev,           "dev-section");
renderApps(apps_productivity,  "productivity-section");
renderApps(apps_multimedia,    "multimedia-section");
renderApps(apps_security,      "security-section");
renderApps(apps_communication, "communication-section");

let selected = []

function switch_clicked(element){
  const value = element.value;

  if (element.checked) {
    selected.push(value);
  } else {
    selected = selected.filter(item => item !== value);
  }

  console.log(selected);
    // document.querySelectorAll(".custom-control-input").forEach(app => {
    //     if(app.checked){
    //       selected.push(app.value)
    //       document.getElementById("confirm-generation").style.display = "block"
    //     }else{
    //       selected.pop(app.value)
    //       document.getElementById("confirm-generation").style.display = "none"
    //     }
    // })
    
    // let script = "sudo snap install"

    // selected.forEach(appSelected => {
    //     if(appSelected == "spotify"){
    //         script += " spotify"
    //     }else if(appSelected == "vscode"){
    //         script += " code --classic"
    //     }
    // })
    // console.log(script)
}

function generate(){
    

}
