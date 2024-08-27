
# Selenium container for tests
{{- if .Values.selenium.enabled }}
        - name: selenium
          image: selenium/standalone-chrome:latest
          resources:
            limits:
              cpu: 100m
              memory: 2048Mi
            requests:
              cpu: 10m
              memory: 512Mi
          env:
            - name: SE_NODE_MAX_SESSIONS
              value: '10'
            - name: SE_NODE_SESSION_TIMEOUT
              value: '100'
            - name: SE_NODE_OVERRIDE_MAX_SESSIONS
              value: 'true'
          ports:
            - containerPort: 4444
              protocol: TCP
            - containerPort: 7900
              protocol: TCP

          readinessProbe:
            exec:
              command:
                - "curl"
                - "--fail"
                - "-o"
                - "/dev/null"
                - "http://localhost:4444/ui"
            periodSeconds: 10
            failureThreshold: 3
            successThreshold: 1
            timeoutSeconds: 5

          startupProbe:
            httpGet:
              path: /ui
              port: 4444
            failureThreshold: 3
            successThreshold: 1
            periodSeconds: 15
            timeoutSeconds: 3
            initialDelaySeconds: 60

{{- end }}

