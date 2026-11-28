function media-down --description "Detiene contenedores Docker activos"
    set -l ids (docker ps -q)
    if test -n "$ids"
        docker stop $ids
    else
        echo "No hay contenedores activos."
    end
end
