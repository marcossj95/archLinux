# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Historial de la cónsola
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

#=================DIRECTORIOS=================
# Opciones de Zsh
unsetopt MENU_COMPLETE                                      # NO autoseleccionar la primera autocompletación
unsetopt FLOW_CONTROL                                       # Desactivar inicio/parada de caracteres en el editor del shell

setopt AUTO_CD                                              # Se mueve al directorio que coincida
setopt ALWAYS_TO_END                                        # Mover el cursor al final de la palabra
setopt AUTO_MENU                                            # Muestra el menú de completación en sucesivos tabs
setopt AUTO_NAME_DIRS                                       # Los parámetros que se establecen con el nombre absoluto de un directorio se convierten inmediatamente en un nombre para ese directorio
setopt AUTO_LIST                                            # Automáticamente muestras las opciones en completaciones ambiguas
setopt AUTO_PARAM_SLASH                                     # Agrega un slash si el parámetro completo es un directorio

setopt COMPLETE_IN_WORD                                     # Permitir la finalización desde dentro de una palabra/frase
setopt CORRECT                                              # Intenta corregir los comandos
setopt PATH_DIRS                                            # Busca en el PATH para completar las palabras

#=================HISTORIAL=================
setopt APPEND_HISTORY                                       # Agrega historial
setopt EXTENDED_HISTORY                                     # Agrega timestamps al historial
setopt INC_APPEND_HISTORY                                   # Historial incremental
setopt HIST_EXPIRE_DUPS_FIRST                               # Se eliminan primero los duplicados más viejosfirst
setopt HIST_IGNORE_ALL_DUPS                                 # NO almacenar duplicados
setopt HIST_IGNORE_SPACE                                    # Elimina del historial los comandos que empiecen con un espacio
setopt HIST_FIND_NO_DUPS                                    # NO muestra los comandos duplicados
setopt HIST_REDUCE_BLANKS                                   # Elimina los espacios en blanco en los comandos guardados
setopt HIST_VERIFY                                          # NO ejecuta el comando, sólo lo muestra
setopt SHARE_HISTORY                                        # Historial compartido entre sesiones

#=================PLUGINS=================
plugins=(git
zsh-autosuggestions
zsh-syntax-highlighting
)

#Archivo de configuración (.oh-my-zsh)
source $ZSH/home/marcos/.oh-my-zsh/oh-my-zsh.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Soporte de idioma para la cónsola
export LANG=es_VE.UTF-8



#========================ALIAS========================
alias ls='lsd --group-dirs=first'
alias cat='bat'
alias top='htop'
alias ip='ip -c addr show'
alias search='searchsploit'
#========================FUNCIONES========================

# Functions
function mkt(){
	mkdir {nmap,contenidos,exploits,apuntes}
	touch apuntes/apuntes.txt
}

# Extract nmap information
function extractPorts(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
