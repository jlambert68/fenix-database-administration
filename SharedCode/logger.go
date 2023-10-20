package SharedCode

import (
	"fmt"
	"github.com/sirupsen/logrus"
	"time"
)

var Logger *logrus.Logger

func InitLogger() {
	Logger = logrus.StandardLogger()

	logrus.SetLevel(logrus.DebugLevel)
	logrus.SetFormatter(&logrus.TextFormatter{
		ForceColors:     false,
		FullTimestamp:   true,
		TimestampFormat: time.RFC3339Nano,
		DisableSorting:  true,
	})
}

// MigrateLogger is a custom logger implementation that uses logrus.Logger for logging by Database Migration
// MigrateLogger is a custom logger implementation that uses logrus.Logger for logging
type MigrateLogger struct {
	Logger     *logrus.Logger
	Verbosity  bool
	migrations int
}

func (l *MigrateLogger) Verbose() bool {

	return true
}

// Printf logs a formatted message
func (l *MigrateLogger) Printf(format string, v ...interface{}) {
	if l.Verbosity {
		message := fmt.Sprintf(format, v...)
		l.Logger.Info(message)
	}
}

// Verbosef logs a verbose formatted message
func (l *MigrateLogger) Verbosef(format string, v ...interface{}) {
	if l.Verbosity {
		message := fmt.Sprintf(format, v...)
		l.Logger.Debug(message)
	}
}

// Errorf logs an error message
func (l *MigrateLogger) Errorf(format string, v ...interface{}) {
	message := fmt.Sprintf(format, v...)
	l.Logger.Error(message)
}

// Warnf logs a warning message
func (l *MigrateLogger) Warnf(format string, v ...interface{}) {
	message := fmt.Sprintf(format, v...)
	l.Logger.Warn(message)
}
