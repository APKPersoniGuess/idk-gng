FROM ://microsoft.com AS build
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out

FROM ://microsoft.com
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "RestoRoom.dll"]
