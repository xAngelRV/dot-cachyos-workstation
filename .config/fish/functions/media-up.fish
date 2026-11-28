function media-up --description "Inicia todos los contenedores Docker detenidos"
    set -l ids (docker ps -aq)
    if test -n "$ids"
        docker start $ids
    else
        echo "No hay contenedores creados."
    end
end
