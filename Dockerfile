FROM golang:latest AS build
WORKDIR /app
COPY go.mod ./
COPY fullCycle.go ./
RUN go build -o /fullCycle


FROM scratch
WORKDIR /
COPY --from=build /fullCycle /fullCycle
ENTRYPOINT ["/fullCycle"]