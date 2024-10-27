# NFS Server için Ubuntu tabanlı bir imaj
FROM ubuntu:latest

# Gerekli paketleri yükle
RUN apt-get update && \
    apt-get install -y nfs-kernel-server && \
    mkdir -p /shared_data

# Exports dosyasını ayarla
RUN echo "/shared_data *(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports

# NFS sunucu işlemini başlat
CMD ["sh", "-c", "service nfs-kernel-server start && tail -f /dev/null"]