# Marcella Maxxima — app estático (PWA) servido por nginx.
# O Easypanel constrói a imagem a partir deste Dockerfile na raiz do repositório.
# Nenhum segredo vai para a imagem: o app aqui é só a frente estática em pwa/.
# A ligação ao vivo (n8n + Supabase) fica no servidor, fora desta imagem.
FROM nginx:alpine
COPY pwa/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
